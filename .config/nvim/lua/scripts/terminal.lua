local M = {}

M.last_command = ""
M.terminal_buf = nil -- Store the single terminal buffer

-- Ensure the terminal buffer exists and create if necessary
local function ensure_terminal_buffer()
  if not M.terminal_buf or not vim.api.nvim_buf_is_valid(M.terminal_buf) then
    vim.cmd('tabnew')
    vim.cmd('terminal')
    M.terminal_buf = vim.api.nvim_get_current_buf() -- Save terminal buffer ID
  else
    -- Switch to the existing terminal buffer
    vim.cmd('buffer ' .. M.terminal_buf)
  end
end

-- Run a new command in the terminal
M.run_in_terminal = function()
  vim.ui.input({ prompt = "Enter command: " }, function(input)
    if input then
      M.last_command = input                                            -- Save command for rerun
      ensure_terminal_buffer()                                          -- Ensure terminal buffer exists
      vim.cmd('call chansend(b:terminal_job_id, "' .. input .. '\\n")') -- Send new command
    end
  end)
end

-- Rerun the last command: Close the terminal buffer and open a new one
M.rerun_last_command = function()
  if M.last_command ~= "" then
    -- Close the existing terminal buffer
    if M.terminal_buf and vim.api.nvim_buf_is_valid(M.terminal_buf) then
      vim.api.nvim_buf_delete(M.terminal_buf, { force = true }) -- Delete terminal buffer
      M.terminal_buf = nil                                      -- Reset terminal buffer
    end
    vim.cmd('tabnew')
    vim.cmd('terminal ' .. M.last_command)
    M.terminal_buf = vim.api.nvim_get_current_buf() -- Save terminal buffer ID
  else
    print("No command to rerun!")
  end
end

-- Delete terminal buffer
M.delete_terminal_buffer = function()
  if M.terminal_buf and vim.api.nvim_buf_is_valid(M.terminal_buf) then
    vim.api.nvim_buf_delete(M.terminal_buf, { force = true }) -- Delete terminal buffer
    M.terminal_buf = nil
    print("Terminal buffer deleted!")
  else
    print("No terminal buffer to delete!")
  end
end

return M
