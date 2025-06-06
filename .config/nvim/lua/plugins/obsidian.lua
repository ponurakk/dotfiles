return {
  "epwalsh/obsidian.nvim",
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Projects",
        path = "~/Documents/Obsidian/Projects",
      }
    },
    notes_subdir = "Quickies",
    new_notes_location = "notes_subdir",
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "Daily",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil
    },
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },
    follow_url_func = function(url)
      vim.fn.jobstart({ "xdg-open", url })
    end,
    attachments = {
      img_folder = "attachments",
    },
    open_notes_in = "vsplit",

    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      -- This is equivalent to the default behavior.
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix(".md")
    end,

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
    -- file it will be ignored but you can customize this behavior here.
    ---@param img string
    follow_img_func = function(img)
      local note_path = vim.api.nvim_buf_get_name(0)
      local note_dir = vim.fn.fnamemodify(note_path, ":h")

      local img_path = note_dir .. "/attachments/" .. img

      if vim.fn.filereadable(img_path) == 1 then
        vim.fn.jobstart({ "feh", img_path }, { detach = true })
      else
        vim.notify("Image not found: " .. img_path, vim.log.levels.ERROR)
      end
    end,

    callbacks = {
      -- Runs anytime you enter the buffer for a note.
      ---@param client obsidian.Client
      ---@param note obsidian.Note
      enter_note = function(client, note)
        local workspace = client.current_workspace
        if workspace and workspace.path then
          vim.cmd("cd " .. tostring(workspace.root))
        end

        client.opts.callbacks.enter_note = function() end
      end,
    },
    ui = {
      enable = false,
    }
  },
}
