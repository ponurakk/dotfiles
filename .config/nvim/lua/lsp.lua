require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "rust_analyzer", "clangd", "kotlin_language_server", "ts_ls", "html", "lua_ls" },
  automatic_installation = false,
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,

    ["rust_analyzer"] = function()
      require("lspconfig").rust_analyzer.setup({
        settings = {
          cargo = {
            allFeatures = true,
          },
        },
      })
    end,

    ["ts_ls"] = function()
      require("lspconfig").ts_ls.setup({
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
              languages = { "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "typescript.tsx",
          "typescriptreact",
          "vue"
        },
      })
    end,

    ["html"] = function()
      require("lspconfig").html.setup({
        filetypes = { "html", "twig", "hbs", "htmldjango" }
      })
    end,

    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          }
        }
      })
    end
  }
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
