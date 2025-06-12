local lsp = require("lsp")

return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end
    },

    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = lsp.ensure_installed,
        automatic_installation = false,
      }
    },

    -- Useful status updates for LSP
    {
      "j-hui/fidget.nvim",
      event = "LspAttach", -- delay loading until an LSP actually attaches
      opts = {},
    },

    -- Additional lua configuration, makes nvim stuff amazing!
    {
      "folke/neodev.nvim",
      ft = "lua", -- only load when editing Lua files
      config = function()
        require("neodev").setup()
      end,
    },

    "pmizio/typescript-tools.nvim",

  },
}
