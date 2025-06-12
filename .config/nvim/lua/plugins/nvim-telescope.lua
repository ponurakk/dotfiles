local icons = require("icons")

return {
  -- Fuzzy Finder (files, lsp, etc)
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
  },
  config = function()
    require("telescope").setup {
      dependencies = { "telescope-fzf-native.nvim" },
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "ivy",
        }
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")

    local extra_args = {
      "--hidden",
      "-g", "!.git/",
      "-g", "!node_modules/",
      "-g", "!target/",
      "-g", "!.idea/",
      "-g", "!Cargo.lock",
      "-g", "!pnpm-lock.yaml",
      "-g", "!package-lock.json",
      "-g", "!lazy-lock.json",
    }

    require("which-key").add({
      {
        "<leader>f",
        function()
          require("telescope.builtin").find_files {
            find_command = { "rg", "--color=never", "--smart-case", "--files", unpack(extra_args) },
          }
        end,
        desc = "Find File",
        icon = icons.ui.FindFile
      },

      {
        "<leader>s",
        group = "Search",
        icon = icons.ui.Search,
        { "<leader><space>", "<cmd>Telescope buffers<cr>",      desc = "Buffers" },
        { "<leader>sb",      "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
        {
          "<leader>sf",
          function()
            require("telescope.builtin").find_files {
              find_command = { "rg", "--color=never", "--smart-case", "--files", "--no-ignore", unpack(extra_args) },
            }
          end,
          desc = "Find File No .gitignore",
          icon = icons.ui.FindFile
        },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>",  desc = "Find Help" },
        { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Find highlight groups" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>",  desc = "Man Pages" },
        { "<leader>sr", "<cmd>Telescope oldfiles<cr>",   desc = "Open Recent File" },
        { "<leader>sR", "<cmd>Telescope registers<cr>",  desc = "Registers" },
        {
          "<leader>st",
          function()
            require("telescope.builtin").live_grep { additional_args = extra_args }
          end,
          desc = "Text",
          icon = icons.ui.FindText
        },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>",                                                     desc = "Keymaps" },
        { "<leader>sC", "<cmd>Telescope commands<cr>",                                                    desc = "Commands" },
        { "<leader>sl", "<cmd>Telescope resume<cr>",                                                      desc = "Resume last search" },
        { "<leader>sg", "<cmd>Telescope git_files<cr>",                                                   desc = "Git files" },
        { "<leader>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview", },
      },
    })
  end
}
