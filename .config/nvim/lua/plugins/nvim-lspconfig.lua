local lsp = require("lsp")

return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end
    },

    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = lsp.ensure_installed,
        integrations = {
          ["mason-lspconfig"] = true,
        }
      },
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

    {
      "pmizio/typescript-tools.nvim",
      ft = "ts",
    },
  },
}
