-- Define the embedded SQL query pattern for rust
local embedded_sql = vim.treesitter.query.parse(
  "rust",
  [[(macro_invocation
    (scoped_identifier
        path: (identifier) @path (#eq? @path "sqlx")
        name: (identifier) @name (#eq? @name "query"))

(token_tree
    (raw_string_literal) @sql)
    (#offset! @sql 1 0 -1 0))]]
)

-- Function to get the root of the syntax tree
local get_root = function(bufnr)
  local parser = vim.treesitter.get_parser(bufnr, "rust", {})
  local tree = parser:parse()[1]
  return tree:root()
end

-- Function to run the SQL formatter script
local run_formatter = function(sql_text)
  local cmd = { "python3", vim.fn.stdpath("config") .. "/scripts/sql-format.py" }
  local stdin = sql_text
  local stdout = vim.fn.system(cmd, stdin)
  if vim.v.shell_error ~= 0 then
    vim.notify("Failed to format SQL: " .. stdout, vim.log.levels.ERROR)
    return {}
  end
  return vim.split(stdout, "\n", { plain = true })
end

-- Function to extract SQL from raw string literal
local extract_sql = function(node_text)
  local sql = node_text:match('r#"(.*)"#')
  return sql
end

-- Function to replace the SQL in the original text with the formatted SQL
local replace_sql = function(original_text, formatted_sql)
  local prefix = original_text:match('(r#")')
  local suffix = original_text:match('("#)')
  local formatted_text = prefix .. table.concat(formatted_sql, "\n") .. suffix
  return formatted_text
end

-- Main function to format SQL embedded in Rust code
local format_dat_sql = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  if vim.bo[bufnr].filetype ~= "rust" then
    vim.notify("Can only be used in Rust", vim.log.levels.ERROR)
    return
  end

  local root = get_root(bufnr)
  local changes = {}

  for id, node in embedded_sql:iter_captures(root, bufnr, 0, -1) do
    local name = embedded_sql.captures[id]
    if name == "sql" then
      -- { start row, start col, end row, end col }
      local range = { node:range() }
      local indentation = string.rep(" ", range[2])

      -- Extract the SQL part, run the formatter, and replace in the original text
      local node_text = vim.treesitter.get_node_text(node, bufnr)
      local sql_text = extract_sql(node_text)
      local formatted_sql = run_formatter(sql_text)

      -- Adjust the formatted SQL to maintain proper indentation
      for idx, line in ipairs(formatted_sql) do
        if idx == 1 then
          formatted_sql[idx] = "\n" .. indentation .. line -- Keep the first line as is
        else
          formatted_sql[idx] = indentation .. line
        end
      end

      local formatted_text = replace_sql(node_text, formatted_sql)

      -- Replace the original SQL part with the formatted SQL within the entire macro
      local start_line = range[1]
      local end_line = range[3]
      local lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line + 1, false)

      local full_text = table.concat(lines, "\n")
      local new_text = full_text:gsub(vim.pesc(node_text), formatted_text)

      local new_lines = vim.split(new_text, "\n")

      -- Keep track of changes
      table.insert(changes, 1, {
        start = start_line,
        final = end_line + 1,
        formatted = new_lines,
      })
    end
  end

  for _, change in ipairs(changes) do
    if change.start <= change.final then
      vim.api.nvim_buf_set_lines(bufnr, change.start, change.final, false, change.formatted)
    else
      vim.notify("Invalid range: start is higher than end", vim.log.levels.ERROR)
    end
  end
end

-- Create a user command to format SQL
vim.api.nvim_create_user_command("FormatSql", function()
  format_dat_sql()
end, {})
