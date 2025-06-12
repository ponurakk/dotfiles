local M = {
  ensure_installed = { "rust_analyzer", "clangd", "ts_ls", "html", "lua_ls", "jsonls" }
}

function M.on_attach(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

function M.capabilities()
  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  return capabilities
end

function M.rust_setup()
  vim.lsp.config("rust_analyzer", {
    capabilities = M.capabilities(),
    on_attach = M.on_attach,
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        procMacro = { enable = true },
        check = { command = "clippy", extraArgs = { "--", "-D", "clippy::unwrap_used", "-W", "missing_docs", "-W", "clippy::pedantic" } }
      }
    },
  })
end

function M.lua_setup()
  vim.lsp.config("lua_ls", {
    capabilities = M.capabilities(),
    on_attach = M.on_attach,
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      }
    },
  })
end

function M.html_setup()
  vim.lsp.config("html", {
    capabilities = M.capabilities(),
    on_attach = M.on_attach,
    filetypes = { "html", "templ", "twig", "hbs", "htmldjango" },
  })
end

function M.ts_setup()
  vim.lsp.config("ts_ls", {
    capabilities = M.capabilities(),
    on_attach = M.on_attach,
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = vim.fn.expand("$HOME/.local/share/pnpm/global/5/node_modules/@vue/typescript-plugin"),
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
end

function M.json_setup()
  vim.lsp.config("jsonls", {
    capabilities = M.capabilities(),
    on_attach = M.on_attach,
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
  })
end

function M.setup()
  M.rust_setup()
  M.ts_setup()
  M.html_setup()
  M.lua_setup()
  M.json_setup()

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(event)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf })
      vim.keymap.set({ "n", "v" }, "<C-CR>", vim.lsp.buf.code_action, { buffer = event.buf })
    end,
  })
end

return M
