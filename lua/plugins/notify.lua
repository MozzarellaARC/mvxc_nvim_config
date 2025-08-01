return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      
      -- Set notify as the default notification handler
      vim.notify = notify
      
      -- Configure notify
      notify.setup({
        background_colour = "#000000",
        timeout = 3000,
        max_width = 50,
        render = "compact",
        stages = "fade_in_slide_out",
      })
    end,
  }
}
