local icons = require("ponurakk.icons")

return {
  -- Add indentation guides even on blank lines
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup {
      enabled = true,
      indent = {
        char = icons.ui.LineLeft,
        smart_indent_cap = true,
      },
      exclude = {
        buftypes = { "terminal", "nofile" },
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "lazy",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "text",
        },
      },
    }
  end,
  opts = {},
}
