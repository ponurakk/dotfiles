local icons = require("icons")
-- [[ Basic Keymaps ]]

-- Disable Space
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "q:", "<Nop>", { silent = true })

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

-- Escape from terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

require("which-key").add({
  { "<leader>;", "<cmd>Alpha<CR>",                          desc = "Dashboard",                   icon = icons.ui.Dashboard },
  { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line", icon = icons.ui.Comment },
  -- { "<leader>c", "<cmd>BufferKill<CR>",                     desc = "Close Buffer" },
  { "<leader>f", "<cmd>Telescope find_files<cr>",           desc = "Find File",                   icon = icons.ui.FindFile },
  { "<leader>e", "<cmd>NvimTreeToggle<CR>",                 desc = "Explorer",                    icon = icons.ui.Tree },
  { "<leader>r", "<cmd>TagbarToggle<CR>",                   desc = "Tagbar",                      icon = icons.ui.Tree },
  { "<leader>u", vim.cmd.UndotreeToggle,                    desc = "Show UndoTree",               icon = icons.ui.Tree },

  {
    "<leader>b",
    group = "Bufers",
    icon = icons.ui.Buffer,
    { "<leader>bj", "<cmd>BufferLinePick<cr>",                    desc = "Jump" },
    { "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
    { "<leader>bb", "<cmd>bp<cr>",                                desc = "Previous" },
    { "<leader>bn", "<cmd>bn<cr>",                                desc = "Next" },
    { "<leader>bW", "<cmd>noautocmd w<cr>",                       desc = "Save without formatting (noautocmd)" },
    { "<leader>be", "<cmd>BufferLinePickClose<cr>",               desc = "Pick which buffer to close", },
    { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>",               desc = "Close all to the left" },
    { "<leader>bl", "<cmd>BufferLineCloseRight<cr>",              desc = "Close all to the right", },
    { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>",         desc = "Sort by directory", },
    { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>",         desc = "Sort by language", },
  },

  {
    "<leader>p",
    group = "Plugins",
    icon = icons.ui.Plug,
    { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install" },
    { "<leader>ps", "<cmd>Lazy sync<cr>",    desc = "Sync" },
    { "<leader>pS", "<cmd>Lazy clear<cr>",   desc = "Status" },
    { "<leader>pc", "<cmd>Lazy clean<cr>",   desc = "Clean" },
    { "<leader>pu", "<cmd>Lazy update<cr>",  desc = "Update" },
    { "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile" },
    { "<leader>pl", "<cmd>Lazy log<cr>",     desc = "Log" },
    { "<leader>pd", "<cmd>Lazy debug<cr>",   desc = "Debug" },
  },

  {
    "<leader>l",
    group = "LSP",
    icon = icons.ui.Language,
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",               desc = "Code Action" },
    { "<leader>lb", "<cmd>Telescope lsp_references<cr>",                    desc = "References" },
    { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
    { "<leader>lw", "<cmd>Telescope diagnostics<cr>",                       desc = "Diagnostics" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>",                    desc = "Format" },
    { "<leader>li", "<cmd>LspInfo<cr>",                                     desc = "Info" },
    { "<leader>lI", "<cmd>Telescope lsp_implementations<cr>",               desc = "Implementations" },
    { "<leader>lD", "<cmd>lua vim.diagnostic.open_float()<cr>",             desc = "Line diagnostics" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>",              desc = "Next Diagnostic", },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",              desc = "Prev Diagnostic", },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                  desc = "CodeLens Action" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>",             desc = "Quickfix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                    desc = "Rename" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",              desc = "Document Symbols" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",     desc = "Workspace Symbols", },
    { "<leader>le", "<cmd>Telescope quickfix<cr>",                          desc = "Telescope Quickfix" },
  },

  {
    "<leader>s",
    group = "Search",
    icon = icons.ui.Search,
    { "<leader>sb", "<cmd>Telescope git_branches<cr>",                                                desc = "Checkout branch" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>",                                                 desc = "Colorscheme" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>",                                                  desc = "Find File",                icon = icons.ui.FindFile },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>",                                                   desc = "Find Help" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>",                                                  desc = "Find highlight groups" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>",                                                   desc = "Man Pages" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>",                                                    desc = "Open Recent File" },
    { "<leader>sR", "<cmd>Telescope registers<cr>",                                                   desc = "Registers" },
    { "<leader>st", "<cmd>Telescope live_grep<cr>",                                                   desc = "Text",                     icon = icons.ui.FindText },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>",                                                     desc = "Keymaps" },
    { "<leader>sC", "<cmd>Telescope commands<cr>",                                                    desc = "Commands" },
    { "<leader>sl", "<cmd>Telescope resume<cr>",                                                      desc = "Resume last search" },
    { "<leader>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview", },
  },

  {
    "<leader>T",
    group = "Tresitter",
    { "<leader>Ti", ":TSConfigInfo<cr>", desc = "Info", icon = icons.diagnostics.Information },
  },

  {
    "<leader>o",
    group = "Notes",
    { "<leader>of", "<cmd>ObsidianSearch<cr>",             desc = "Open notes",   icon = icons.ui.Note },
    { "<leader>on", require("scripts.notes").new_note,     desc = "New Note",     icon = icons.ui.Note },
    { "<leader>op", require("scripts.notes").project_note, desc = "Project note", icon = icons.ui.Note },
  },

  {
    "<leader>t",
    group = "Tabs",
    { "<leader>tn", "<cmd>tabnew<cr>",                                  desc = "New Tab",         icon = icons.ui.NewFile },
    { "<leader>tl", "<cmd>tabnext<cr>",                                 desc = "Next Tab",        icon = icons.ui.BoldArrowRight },
    { "<leader>th", "<cmd>tabprevious<cr>",                             desc = "Previous Tab",    icon = icons.ui.BoldArrowLeft },
    { "<leader>tc", "<cmd>tabclose<cr>",                                desc = "Close Tab",       icon = icons.ui.BoldClose },

    { "<leader>tt", require("scripts.terminal").run_in_terminal,        desc = "New Terminal",    icon = icons.ui.Code },
    { "<leader>tr", require("scripts.terminal").rerun_last_command,     desc = "Re Run",          icon = icons.ui.Code },
    { "<leader>td", require("scripts.terminal").delete_terminal_buffer, desc = "Delete Terminal", icon = icons.ui.Code },
  },

  {
    "g",
    group = "Goto",
    { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "[G]oto [D]eclaration" },
  },
})

require("which-key").add({
  mode = { "v" },
  { "<leader>",   name = "VISUAL <leader>" },
  { "<leader>/",  "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
})
