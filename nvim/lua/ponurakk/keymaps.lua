-- [[ Basic Keymaps ]]

-- Disable Space
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "q:", "<Nop>", { silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>t", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>r", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Center when moving half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center when finding
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Save buffer
vim.keymap.set("n", "<leader>P", "\"_dP")

-- Stay at place when combining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Remove highlight
vim.keymap.set("n", "<F3>", ":noh<CR>")

-- Move in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', "K", "lua vim.lsp.buf.hover()")
vim.keymap.set('n', "gd", "lua vim.lsp.buf.definition()")

require("which-key").register({
  ["<leader>;"] = { "<cmd>Alpha<CR>", "Dashboard" },

  ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },

  ["<leader>c"] = { "<cmd>BufferKill<CR>", "Close Buffer" },

  ["<leader>f"] = { "<cmd>Telescope find_files<cr>", "Find File" },

  ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },

  ["<leader>u"] = { vim.cmd.UndotreeToggle, "Show UndoTree" },

  ["<leader>b"] = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
    e = {
      "<cmd>BufferLinePickClose<cr>",
      "Pick which buffer to close",
    },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  },

  ["<leader>p"] = {
    name = "Plugins",
    i = { "<cmd>Lazy install<cr>", "Install" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    S = { "<cmd>Lazy clear<cr>", "Status" },
    c = { "<cmd>Lazy clean<cr>", "Clean" },
    u = { "<cmd>Lazy update<cr>", "Update" },
    p = { "<cmd>Lazy profile<cr>", "Profile" },
    l = { "<cmd>Lazy log<cr>", "Log" },
    d = { "<cmd>Lazy debug<cr>", "Debug" },
  },

  ["<leader>l"] = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { "<cmd>Format<CR>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    D = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line diagnostics" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic", },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  },

  ["<leader>s"] = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    l = { "<cmd>Telescope resume<cr>", "Resume last search" },
    p = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorscheme with Preview" },
  },

  ["<leader>T"] = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  }
})


require("which-key").register({
  ["<leader>"] = { name = "VISUAL <leader>" },
  ["<leader>h"] = { "Git [H]unk" },
  ["<leader>/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
  ["<leader>l"] = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  },
}, { mode = "v" })
