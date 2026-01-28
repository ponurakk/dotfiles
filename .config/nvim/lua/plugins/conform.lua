return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
        typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
        json = { "biome" },
        htmldjango = { "djlint" }
      },
      formatters = {
        djlint = {
          append_args = { "--ignore-blocks", "block,import,extends", "--custom-blocks", "match,when", "--close-void-tags", "--max-blank-lines", "1", "--indent", "2", "--profile", "jinja", "--no-function-formatting", "--max-attribute-length", "120" }
        }
      },
      notify_no_formatters = true,
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 1000,
      },
    })
  end,
}
