-- Global notification override
-- This replaces ALL vim.notify calls throughout Neovim with our custom notify system

local M = {}

function M.setup()
  -- Store the original vim.notify function as backup
  local original_notify = vim.notify
  
  -- Get our custom notification utility
  local notify_util = require('config.notify')
  
  -- Override vim.notify globally
  vim.notify = function(message, level, opts)
    -- Handle different input types
    if type(message) ~= "string" then
      message = tostring(message)
    end
    
    -- Map vim log levels to our notification functions
    level = level or vim.log.levels.INFO
    opts = opts or {}
    
    -- Route to our custom notifications based on level
    if level == vim.log.levels.ERROR then
      notify_util.error(message, opts)
    elseif level == vim.log.levels.WARN then
      notify_util.warn(message, opts)
    elseif level == vim.log.levels.INFO then
      notify_util.info(message, opts)
    elseif level == vim.log.levels.DEBUG then
      notify_util.info(message, opts) -- Treat debug as info
    else
      notify_util.info(message, opts) -- Default to info
    end
  end
  
  -- Also override common vim messages that don't use vim.notify
  local function override_vim_messages()
    -- Override print function to use notifications
    local original_print = print
    print = function(...)
      local args = {...}
      local message = table.concat(vim.tbl_map(tostring, args), " ")
      notify_util.info(message)
    end
    
    -- Intercept echo commands
    vim.api.nvim_create_autocmd("CmdlineEnter", {
      callback = function()
        -- This will catch some command-line messages
      end
    })
    
    -- Override some common vim command outputs
    vim.api.nvim_create_user_command("W", function()
      vim.cmd("write")
      notify_util.success("File written")
    end, { desc = "Write file with notification" })
    
    vim.api.nvim_create_user_command("Q", function()
      vim.cmd("quit")
      notify_util.info("Buffer closed")
    end, { desc = "Quit with notification" })
    
    vim.api.nvim_create_user_command("Wq", function()
      vim.cmd("write")
      notify_util.success("File written")
      vim.cmd("quit")
    end, { desc = "Write and quit with notification" })
  end
  
  -- Set up the overrides
  override_vim_messages()
  
  -- Return the original notify function in case we need it
  return original_notify
end

return M
