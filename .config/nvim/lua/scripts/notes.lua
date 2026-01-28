local M = {}
M.buf = nil
local obsidian = require("obsidian").get_client()

M.new_note = function()
  local user_input = vim.fn.input("Note name: ")
  local topic = vim.fn.input("Topic (optional): ")
  local tags = { "quickie" }

  if topic ~= '' then
    table.insert(tags, topic)
  end

  local note = obsidian:create_note {
    id = user_input,
    title = user_input,
    no_write = true,
    tags = tags,
  }

  vim.cmd('tabnew')
  obsidian:open_note(note, { sync = true, open_strategy = "current" })
  obsidian:write_note_to_buffer(note)
end

M.project_note = function()
  local path = vim.fn.getcwd()
  local dir_name = string.match(path, "([^/]+)$")

  local vsplit_exists = false
  if M.buf then
    local buf_name = vim.api.nvim_buf_get_name(M.buf)
    if buf_name:match(dir_name) then
      vsplit_exists = true
    end
  end

  if vsplit_exists then
    vim.api.nvim_win_close(vim.api.nvim_get_current_win(), true)
    M.buf = nil
  else
    local note = obsidian:create_note {
      id = dir_name,
      title = dir_name,
      no_write = true,
      dir = "Projects"
    }

    vim.cmd("vs")
    obsidian:open_note(note, { sync = true, open_strategy = "current" })
    vim.cmd("vertical resize 40")
    vim.cmd("setlocal winfixwidth")

    if obsidian:resolve_note(note.path.name) == nil then
      obsidian:write_note_to_buffer(note)
    end

    M.buf = vim.api.nvim_get_current_buf()
  end
end

return M
