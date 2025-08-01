return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      
      -- Set notify as the default notification handler
      vim.notify = notify
      
      -- Configure notify with full GUI options
      notify.setup({
        -- Animation style: "fade", "slide", "fade_in_slide_out", "static"
        stages = "static",
        
        -- Timeout in milliseconds
        timeout = 3000,
        
        -- Max width of notification window
        max_width = 50,
        
        -- Max height of notification window  
        max_height = 10,
        
        -- Render style: "default", "minimal", "simple", "compact"
        render = "compact",
        
        -- Background color (hex) - you can change this to match your theme
        background_colour = "#1f1f28",

        -- Remove border completely
        border = "shadow",
        
        -- Position: true = top-down, false = bottom-up
        top_down = false,
        
        -- Minimum notification level to show
        level = vim.log.levels.INFO,
        
        -- Icons for different levels (optional, will use defaults if not set)
        -- icons = {
        --   ERROR = "✗",
        --   WARN = "⚠",
        --   INFO = "ℹ",
        --   DEBUG = "🐛",
        --   TRACE = "✎",
        -- },
        
        -- Animation fps
        fps = 30,
        
        -- Function called when a new window is opened
        on_open = nil,
        
        -- Function called when a window is closed
        on_close = nil,
      })
    end,
  }
}
