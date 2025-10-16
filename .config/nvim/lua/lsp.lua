local M = {
  ensure_installed = {
    { "rust-analyzer", condition = function() return vim.fn.executable("rustup") == 1 end },
    { "clangd",        condition = function() return vim.fn.executable("clang") == 1 end },
    { "gopls",         condition = function() return vim.fn.executable("go") == 1 end },
    "typescript-language-server",
    "html-lsp",
    "lua-language-server",
    "bash-language-server",
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "marksman",
    "tailwindcss-language-server",
    "taplo",
  }
}

function M.on_attach(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

function M.capabilities()
  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  -- local base_capabilities = vim.lsp.protocol.make_client_capabilities()
  -- local lspconfig_capabilities = require("lspconfig.util").default_config.capabilities
  -- local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
  --
  -- local capabilities = vim.tbl_deep_extend("force", base_capabilities, lspconfig_capabilities, cmp_capabilities)

  local capabilities = require("cmp_nvim_lsp").default_capabilities(
    require("lspconfig.util").default_config.capabilities
  )

  return capabilities
end

function M.rust_setup()
  vim.lsp.config("rust_analyzer", {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        procMacro = { enable = true },
        check = { command = "clippy", extraArgs = { "--", "-D", "clippy::unwrap_used", "-W", "missing_docs", "-W", "clippy::pedantic" } },
        inlayHints = {
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true,
          },
        }
      }
    },
  })
end

function M.lua_setup()
  vim.lsp.config("lua_ls", {
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
    filetypes = { "html", "templ", "twig", "hbs", "htmldjango" },
  })
end

function M.ts_setup()
  vim.lsp.config("ts_ls", {
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
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
  })
end

function M.setup()
  local registry = require("mason-registry")
  local package_to_lspconfig = {}
  for _, pkg_spec in ipairs(registry.get_all_package_specs()) do
    local lspconfig = vim.tbl_get(pkg_spec, "neovim", "lspconfig")
    if lspconfig then
      package_to_lspconfig[pkg_spec.name] = lspconfig
    end
  end

  for _, pkg in ipairs(registry.get_installed_packages()) do
    if pkg.spec.categories[1] == "LSP" then
      local lsp_name = package_to_lspconfig[pkg.name]

      if lsp_name then
        vim.lsp.config(lsp_name, {
          on_attach = M.on_attach,
          -- capabilities = M.capabilities(),
        })

        vim.lsp.enable(lsp_name)
      end
    end
  end

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
