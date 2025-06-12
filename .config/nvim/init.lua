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
  require("plugins.catppuccin"),

  -- Statuses
  "wakatime/vim-wakatime",
  "FilipHarald/aw-watcher-vim",
  -- require("plugins.presence"),
  require("plugins.timewasted"),

  -- Syntax
  "ziglang/zig.vim",
  -- "udalov/kotlin-vim",
  "fwcd/kotlin-language-server",
  -- "jdonaldson/vaxe",
  "mustache/vim-mustache-handlebars",
  require("plugins.markdown"),
  "prettier/vim-prettier",

  require("plugins.nvim-cmp"),
  require("plugins.nvim-lspconfig"),
  require("plugins.nvim-telescope"),
  require("plugins.nvim-treesitter"),
  require("plugins.nvim-tree"),

  -- "Gui" :P
  require("plugins.lualine"),
  require("plugins.transparent"),
  require("plugins.which-key"),
  require("plugins.alpha"),
  require("plugins.trouble"),
  require("plugins.nvim-navic"),
  require("plugins.nvim-ufo"),

  -- QoL
  require("plugins.auto-pairs"),
  require("plugins.autoformat"),
  require("plugins.todo-comments"),
  require("plugins.indent-blankline"),
  require("plugins.numb"),
  require("plugins.obsidian"),
  require("plugins.undotree"),
  require("plugins.gitsigns"),
  require("plugins.guess-indent"),
  require("plugins.codeium"),
  "christoomey/vim-tmux-navigator",
  "numToStr/Comment.nvim",
  "RRethy/vim-illuminate",
  "preservim/tagbar",
  "b0o/SchemaStore.nvim",
}, {})

require("settings")
require("keymaps")

require("lsp").setup()

-- Scripts
require("scripts.sql-rust-format")
