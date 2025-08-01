-- Centralized notification utility
-- Usage: local notify = require('config.notify')
--        notify.success("Operation completed")
--        notify.error("Something went wrong")
--        notify.info("Information message")
--        notify.warn("Warning message")

local global_notify = {}

-- Icons for different notification types
-- global_notify.icons = {
--   ERROR = "✗",
--   WARN = "⚠",
--   INFO = "ℹ",
--   DEBUG = "🐛",
--   SUCCESS = "✓",
--   GIT_SUCCESS = "🔥",
--   GIT_ERROR = "❌",
--   GIT_INFO = "📝",
-- }

-- Notification levels
global_notify.levels = {
  ERROR = vim.log.levels.ERROR,
  WARN = vim.log.levels.WARN,
  INFO = vim.log.levels.INFO,
  DEBUG = vim.log.levels.DEBUG,
}

-- Default notification function (fallback if nvim-notify isn't available)
local function default_notify(message, level)
  vim.notify(message, level)
end

-- Get the notification function (nvim-notify if available, otherwise default)
local function get_notify()
  local ok, notify = pcall(require, "notify")
  if ok then
    return notify
  else
    return default_notify
  end
end

-- Notification wrapper functions
function global_notify.notify(message, level, opts)
  local notify_fn = get_notify()
  opts = opts or {}
  
  if notify_fn == default_notify then
    notify_fn(message, level or global_notify.levels.INFO)
  else
    notify_fn(message, level or global_notify.levels.INFO, opts)
  end
end

function global_notify.success(message, opts)
  global_notify.notify(message, global_notify.levels.INFO, opts)
end

function global_notify.error(message, opts)
  global_notify.notify(message, global_notify.levels.ERROR, opts)
end

function global_notify.warn(message, opts)
  global_notify.notify( message, global_notify.levels.WARN, opts)
end

function global_notify.info(message, opts)
  global_notify.notify(message, global_notify.levels.INFO, opts)
end

-- Git-specific notifications
global_notify.git = {
  success = function(message, opts)
    global_notify.notify(message, global_notify.levels.INFO, opts)
  end,
  error = function(message, opts)
    global_notify.notify(message, global_notify.levels.ERROR, opts)
  end,
  info = function(message, opts)
    global_notify.notify(message, global_notify.levels.INFO, opts)
  end,
}

return global_notify
