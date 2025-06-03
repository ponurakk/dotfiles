local icons = require("icons")

local function on_attach(bufnr)
  local gs = package.loaded.gitsigns

  require("which-key").add({
    {
      "<leader>h",
      group = "Git",
      icon = icons.git.Repo,
      { "<leader>hs", gs.stage_hunk,          desc = "[S]tage hunk" },
      { "<leader>hr", gs.reset_hunk,          desc = "[R]eset hunk" },
      { "<leader>hu", gs.undo_stage_hunk,     desc = "[U]ndo Stage Hunk" },
      { "<leader>hS", gs.stage_buffer,        desc = "[S]tage buffer" },
      { "<leader>hR", gs.reset_buffer,        desc = "[R]eset Buffer" },
      { "<leader>hp", gs.preview_hunk_inline, desc = "[P]review Hunk" },
      { "<leader>hl", gs.setloclist,          desc = "Loc [L]ist" },
      { "<leader>hn", gs.next_hunk,           desc = "[N]ext hunk" },
      { "<leader>hN", gs.prev_hunk,           desc = "[P]rev hunk" },
      { "<leader>hb", gs.blame,               desc = "[B]lame" },
      {
        "<leader>ht",
        group = "Toggle",
        icon = icons.git.Diff,
        { "<leader>htb", gs.toggle_current_line_blame, desc = "[T]oggle Git [B]lame Line" },
        { "<leader>htl", gs.toggle_linehl,             desc = "[T]oggle [H]ine Highlight" },
        { "<leader>htn", gs.toggle_numhl,              desc = "[T]oggle [N]umber Highlight" },
        { "<leader>htw", gs.toggle_word_diff,          desc = "[T]oggle [W]ord Diff" },
        { "<leader>htd", gs.toggle_deleted,            desc = "[T]oggle [D]eleted" },
      },
    }
  })

  require("which-key").add({
    mode = { "v" },
    {
      "<leader>h",
      group = "Git",
      icon = icons.git.Repo,
      {
        "<leader>hs",
        function()
          gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end,
        desc = "[S]tage hunk"
      },
      {
        "<leader>hr",
        function()
          gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end,
        desc = "[R]eset hunk"
      },
    }
  })
end

return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame_opts = {
      delay = 0,
      virt_text_pos = "right_align"
    },
    on_attach = on_attach,
  },
}
