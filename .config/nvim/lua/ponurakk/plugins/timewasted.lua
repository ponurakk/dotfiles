return {
  "Lamby777/timewasted.nvim",
  config = function()
    local tw = require("timewasted")
    tw.setup {
      autosave_delay = 30,
      time_formatter = function(total_sec)
        local time_str = require("timewasted").dhms_fmt(total_sec)
        return string.format("TW: %s", time_str)
      end
    }
  end
}
