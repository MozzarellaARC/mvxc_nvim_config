-- Centralized notification utility
-- Usage: local notify = require('config.notify')
--        notify.success("Operation completed")
--        notify.error("Something went wrong")
--        notify.info("Information message")
--        notify.warn("Warning message")

local M = {}

-- Icons for different notification types
M.icons = {
  ERROR = "✗",
  WARN = "⚠",
  INFO = "ℹ",
  DEBUG = "🐛",
  SUCCESS = "✓",
  GIT_SUCCESS = "🔥",
  GIT_ERROR = "❌",
  GIT_INFO = "📝",
}

-- Notification levels
M.levels = {
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
function M.notify(message, level, opts)
  local notify_fn = get_notify()
  opts = opts or {}
  
  if notify_fn == default_notify then
    notify_fn(message, level or M.levels.INFO)
  else
    notify_fn(message, level or M.levels.INFO, opts)
  end
end

function M.success(message, opts)
  M.notify(M.icons.SUCCESS .. " " .. message, M.levels.INFO, opts)
end

function M.error(message, opts)
  M.notify(M.icons.ERROR .. " " .. message, M.levels.ERROR, opts)
end

function M.warn(message, opts)
  M.notify(M.icons.WARN .. " " .. message, M.levels.WARN, opts)
end

function M.info(message, opts)
  M.notify(M.icons.INFO .. " " .. message, M.levels.INFO, opts)
end

-- Git-specific notifications
M.git = {
  success = function(message, opts)
    M.notify(M.icons.GIT_SUCCESS .. " " .. message, M.levels.INFO, opts)
  end,
  error = function(message, opts)
    M.notify(M.icons.GIT_ERROR .. " " .. message, M.levels.ERROR, opts)
  end,
  info = function(message, opts)
    M.notify(M.icons.GIT_INFO .. " " .. message, M.levels.INFO, opts)
  end,
}

return M
