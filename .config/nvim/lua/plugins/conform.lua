return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
        typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
        htmldjango = { "djlint" }
      },
      formatters = {
        djlint = {
          append_args = { "--ignore-blocks", "block,call,import,extends", "--close-void-tags", "--max-blank-lines", "1", "--indent", "2" }
        }
      },
      notify_no_formatters = true,
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    })
  end,
}
