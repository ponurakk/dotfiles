local icons = require("ponurakk.icons")
local colors = {
  black        = "#1a1a1a",
  white        = "#fafafa",
  red          = "#E05A62",
  green        = "#98be65",
  blue         = "#8298D5",
  yellow       = "#ec895b",
  gray         = "#3f3f46",
  darkgray     = "#282828",
  lightgray    = "#504945",
  inactivegray = "#7c6f64",
}

local theme = {
  normal = {
    a = { bg = colors.gray, fg = colors.black, gui = "bold" },
    b = { bg = colors.darkgray, fg = colors.white },
    c = { bg = colors.black }
  },

  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = "bold" },
    b = { bg = colors.gray, fg = colors.white },
    c = { bg = colors.black }
  },

  visual = {
    a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
    b = { bg = colors.gray, fg = colors.white },
    c = { bg = colors.black }
  },

  replace = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.gray, fg = colors.white },
    c = { bg = colors.black }
  },

  command = {
    a = { bg = colors.red, fg = colors.black, gui = "bold" },
    b = { bg = colors.gray, fg = colors.white },
    c = { bg = colors.black }
  },

  inactive = {
    a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
    b = { bg = colors.gray, fg = colors.gray },
    c = { bg = colors.black }
  }
}

local M = {}

M.mode = {
  function()
    return " " .. icons.ui.Target .. " "
  end,
  padding = { left = 0, right = 0 },
  color = {},
  cond = nil,
}

M.branch = {
  "b:gitsigns_head",
  icon = icons.git.Branch,
  color = { gui = "bold" },
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

M.diff = {
  "diff",
  source = diff_source,
  symbols = {
    added = icons.git.LineAdded .. " ",
    modified = icons.git.LineModified .. " ",
    removed = icons.git.LineRemoved .. " ",
  },
  padding = { left = 2, right = 1 },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  cond = nil,
}

M.spaces = {
  function()
    local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
    return icons.ui.Tab .. " " .. shiftwidth
  end,
  padding = 1,
}

M.filename = { "filename" }
M.filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } }
M.fileformat = { "fileformat" }
M.location = { "location" }
M.navic = { "navic" }

M.treesitter = {
  function()
    return icons.ui.Tree
  end,
  color = function()
    local buf = vim.api.nvim_get_current_buf()
    local ts = vim.treesitter.highlighter.active[buf]
    return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
  end,
}

M.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = {
    error = icons.diagnostics.BoldError .. " ",
    warn = icons.diagnostics.BoldWarning .. " ",
    info = icons.diagnostics.BoldInformation .. " ",
    hint = icons.diagnostics.BoldHint .. " ",
  },
  -- cond = conditions.hide_in_width,
}

M.progress = {
  "progress",
  fmt = function()
    return "%P/%L"
  end,
  color = {},
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      theme = theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = { M.mode },
      lualine_b = { M.branch },
      lualine_c = { M.diff, M.filename, M.navic },
      lualine_x = { M.diagnostics, },
      lualine_y = { M.spaces, M.filetype, M.fileformat, M.treesitter, M.location },
      lualine_z = { M.progress }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { M.location },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  },
}
