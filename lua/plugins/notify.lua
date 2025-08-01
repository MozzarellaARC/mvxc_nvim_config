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
        -- background_colour = "#1f1f28",

        -- Remove border completely (force no border)
        -- border = "none",        
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
      
      -- Remove borders by making border highlights transparent
      vim.cmd([[
        hi NotifyERRORBorder guifg=#1f1f28 guibg=#1f1f28
        hi NotifyWARNBorder guifg=#1f1f28 guibg=#1f1f28  
        hi NotifyINFOBorder guifg=#1f1f28 guibg=#1f1f28
        hi NotifyDEBUGBorder guifg=#1f1f28 guibg=#1f1f28
        hi NotifyTRACEBorder guifg=#1f1f28 guibg=#1f1f28
        hi NotifyBackground guibg=#1f1f28
      ]])
      
      -- Set up autocommands for file operations notifications
      local group = vim.api.nvim_create_augroup("NotifyOperations", { clear = true })
      
      -- Notify on file save
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        callback = function()
          local filename = vim.fn.expand("%:t")
          if filename ~= "" then
            vim.notify("💾 Saved: " .. filename, vim.log.levels.INFO, {
              title = "File Operation",
              timeout = 1500,
            })
          end
        end,
      })
      
      -- Notify on directory change
      vim.api.nvim_create_autocmd("DirChanged", {
        group = group,
        callback = function()
          local cwd = vim.fn.getcwd()
          local dir_name = vim.fn.fnamemodify(cwd, ":t")
          vim.notify("📁 Changed to: " .. dir_name, vim.log.levels.INFO, {
            title = "Directory Change",
            timeout = 2000,
          })
        end,
      })
      
      -- Notify on file rename (when a buffer gets a new name)
      vim.api.nvim_create_autocmd("BufFilePost", {
        group = group,
        callback = function()
          local filename = vim.fn.expand("%:t")
          if filename ~= "" then
            vim.notify("✏️ Renamed to: " .. filename, vim.log.levels.INFO, {
              title = "File Operation",
              timeout = 2000,
            })
          end
        end,
      })
      
      -- Notify on new file creation
      vim.api.nvim_create_autocmd("BufNewFile", {
        group = group,
        callback = function()
          local filename = vim.fn.expand("%:t")
          if filename ~= "" then
            vim.notify("📄 Created: " .. filename, vim.log.levels.INFO, {
              title = "File Operation",
              timeout = 2000,
            })
          end
        end,
      })
      
      -- Notify on file deletion (when buffer is deleted and file doesn't exist)
      vim.api.nvim_create_autocmd("BufDelete", {
        group = group,
        callback = function()
          local filename = vim.fn.expand("<afile>:t")
          if filename ~= "" and vim.fn.filereadable(vim.fn.expand("<afile>")) == 0 then
            vim.notify("🗑️ Deleted: " .. filename, vim.log.levels.WARN, {
              title = "File Operation",
              timeout = 2000,
            })
          end
        end,
      })
      
      -- Custom functions for manual operations
      _G.notify_operations = {
        -- Function to notify file copy
        file_copied = function(source, dest)
          local source_name = vim.fn.fnamemodify(source, ":t")
          local dest_name = vim.fn.fnamemodify(dest, ":t")
          vim.notify("📋 Copied: " .. source_name .. " → " .. dest_name, vim.log.levels.INFO, {
            title = "File Operation",
            timeout = 2500,
          })
        end,
        
        -- Function to notify file move
        file_moved = function(source, dest)
          local source_name = vim.fn.fnamemodify(source, ":t")
          local dest_name = vim.fn.fnamemodify(dest, ":t")
          vim.notify("🚚 Moved: " .. source_name .. " → " .. dest_name, vim.log.levels.INFO, {
            title = "File Operation",
            timeout = 2500,
          })
        end,
        
        -- Function to notify successful operations
        success = function(message)
          vim.notify("✅ " .. message, vim.log.levels.INFO, {
            title = "Success",
            timeout = 2000,
          })
        end,
        
        -- Function to notify errors
        error = function(message)
          vim.notify("❌ " .. message, vim.log.levels.ERROR, {
            title = "Error",
            timeout = 3000,
          })
        end,
      }
    end,
  }
}
