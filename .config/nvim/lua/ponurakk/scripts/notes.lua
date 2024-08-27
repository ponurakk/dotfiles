local M = {}
local obsidian = require("obsidian").get_client()

M.new_note = function()
  local user_input = vim.fn.input("Note name: ")
  local topic = vim.fn.input("Topic (optional): ")
  local tags = { "quickie" }

  if topic ~= '' then
    table.insert(tags, topic)
  end

  local note = obsidian:create_note {
    title = user_input,
    no_write = true,
    tags = tags,
  }

  obsidian:open_note(note, { sync = true })
  obsidian:write_note_to_buffer(note)
end

return M
