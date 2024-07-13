vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require("lazy").setup({
  -- Theme
  require("ponurakk.plugins.catppuccin"),

  -- Statuses
  "wakatime/vim-wakatime",
  "ActivityWatch/aw-watcher-vim",
  require("ponurakk.plugins.presence"),

  -- Syntax
  "ziglang/zig.vim",
  "udalov/kotlin-vim",
  require("ponurakk.plugins.markdown"),

  require("ponurakk.plugins.nvim-cmp"),
  require("ponurakk.plugins.nvim-lspconfig"),
  require("ponurakk.plugins.nvim-telescope"),
  require("ponurakk.plugins.nvim-treesitter"),
  require("ponurakk.plugins.nvim-tree"),

  -- "Gui" :P
  require("ponurakk.plugins.lualine"),
  require("ponurakk.plugins.transparent"),
  require("ponurakk.plugins.which-key"),
  require("ponurakk.plugins.alpha"),
  require("ponurakk.plugins.trouble"),
  require("ponurakk.plugins.nvim-navic"),
  require("ponurakk.plugins.nvim-ufo"),

  -- QoL
  require("ponurakk.plugins.auto-pairs"),
  require("ponurakk.plugins.todo-comments"),
  require("ponurakk.plugins.indent-blankline"),
  require("ponurakk.plugins.autoformat"),
  require("ponurakk.plugins.numb"),
  require("ponurakk.plugins.obsidian"),
  require("ponurakk.plugins.undotree"),
  require("ponurakk.plugins.gitsigns"),
  require("ponurakk.plugins.guess-indent"),
  "christoomey/vim-tmux-navigator",
  "numToStr/Comment.nvim",
  "RRethy/vim-illuminate",
}, {})

require("ponurakk.settings")
require("ponurakk.keymaps")
require("ponurakk.lsp")

-- Scripts
require("ponurakk.scripts.sql-rust-format")

require("ponurakk.plugins.nvim-tree").setup()
