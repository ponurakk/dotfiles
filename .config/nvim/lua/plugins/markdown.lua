local icons = require("icons")

return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  ft = "markdown",
  ---@module "render-markdown"
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require("render-markdown").setup({
      render_modes = true,
      debounce = 100,
      file_types = { "markdown" },
      heading = {
        sign = true,
        width = "block",
        min_width = 100,
      },
      code = {
        width = "block",
        left_pad = 2,
        right_pad = 4,
        min_width = 100,
        border = "thick"
      },
      dash = {
        width = 100,
      },
      checkbox = {
        checked = {
          scope_highlight = "@markup.strikethrough"
        },
        custom = {
          important = {
            raw = "[!]",
            rendered = icons.diagnostics.BoldWarning .. " ",
            highlight = "DiagnosticError",
          },
        },
      },
      pipe_table = {
        min_width = 12,
      },
      link = {
        custom = {
          rust = { pattern = "%.rs$", icon = "󱘗 " },
          c = { pattern = "%.c$", icon = "󰙱 ", },
          cpp = { pattern = "%.cpp$", icon = "󰙲 ", },
          zig = { pattern = "%.zig$", icon = " ", },
          python = { pattern = "%.py$", icon = "󰌠 ", },
          java = { pattern = "%.java$", icon = "󰬷 ", },
          kotlin = { pattern = "%.kt$", icon = "󱈙 ", },
          typescript = { pattern = "%.ts$", icon = "󰛦 ", },
          javascript = { pattern = "%.js$", icon = " ", },
          markdown = { pattern = "%.md$", icon = "󰍔 ", },
          html = { pattern = "%.html$", icon = "󰌝 ", },
          css = { pattern = "%.css$", icon = " ", },
        }
      },
      sign = { enabled = true },
      -- With `pylatexenc`
      latex = {
        enabled = true,
        render_modes = false,
        converter = "latex2text",
        highlight = "RenderMarkdownMath",
        position = "above",
        top_pad = 0,
        bottom_pad = 0,
      },
    })
  end
}
