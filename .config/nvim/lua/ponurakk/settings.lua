vim.opt.fileencoding = "utf-8"

-- Set highlight on search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.cursorline = true
-- vim.api.nvim_win_set_option(0, "cursorline", true) -- does!

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

vim.opt.termguicolors = true
vim.opt.colorcolumn = "120"
vim.opt.conceallevel = 2
vim.opt.wrap = false

-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--   pattern = { "*.md" },
--   callback = function()
--     vim.opt.conceallevel = 1
--   end
-- })

-- Padding to screen before scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Set height of popup box
vim.opt.pumheight = 15

vim.opt.ignorecase = true

-- Hide things like --INSERT--
vim.opt.showmode = false

-- Change placement of splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Only one status line
vim.opt.laststatus = 3

-- Convert tabs to spaces
vim.opt.expandtab = true

vim.opt.tabstop = 2      -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 2  -- Number of spaces to use for a <Tab>
vim.opt.shiftwidth = 2   -- Number of spaces to use for each step of (auto)indent

vim.opt.foldcolumn = '0' -- '0' is not bad
vim.opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
