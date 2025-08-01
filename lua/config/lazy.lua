-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.opt.number = true        -- Show absolute line numbers
vim.opt.relativenumber = false -- Show relative line numbers (optional)

-- Indentation settings
vim.opt.expandtab = false     -- Use tabs instead of spaces
vim.opt.shiftwidth = 4        -- Size of an indent
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.softtabstop = 4       -- Number of spaces tabs count for in insert mode
vim.opt.smartindent = true    -- Smart autoindenting
vim.opt.list = true           -- Show some invisible characters
vim.opt.listchars = { tab = '  ', trail = '·', extends = '>', precedes = '<' }

-- -- Status line and command line configuration
-- vim.opt.laststatus = 3         -- Global statusline (single statusline for all windows)
-- vim.opt.cmdheight = 0          -- Standard command line height (fixes character input bugs)
-- vim.opt.showmode = false       -- Don't show mode in command line since statusline shows it

-- Session options for auto-session plugin
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Clipboard
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus"

-- Barbar keybindings moved to barbar.lua plugin config
-- vim.g.barbar_auto_setup = false -- disable auto-setup

-- Auto-cleanup shada temporary files to prevent write errors
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("ShadaCleanup", { clear = true }),
  callback = function()
    local shada_dir = vim.fn.stdpath("data") .. "/shada"
    local temp_files = vim.fn.glob(shada_dir .. "/main.shada.tmp.*", false, true)
    
    if #temp_files > 0 then
      for _, file in ipairs(temp_files) do
        pcall(vim.fn.delete, file)
      end
    end
  end,
})

-- Also cleanup on exit to prevent accumulation
vim.api.nvim_create_autocmd("VimLeavePre", {
  group = vim.api.nvim_create_augroup("ShadaExitCleanup", { clear = true }),
  callback = function()
    local shada_dir = vim.fn.stdpath("data") .. "/shada"
    local temp_files = vim.fn.glob(shada_dir .. "/main.shada.tmp.*", false, true)
    
    if #temp_files > 0 then
      for _, file in ipairs(temp_files) do
        pcall(vim.fn.delete, file)
      end
    end
  end,
})

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Add your plugins here, or import them from other modules
    { import = "config.color-schemes" },
    { import = "plugins" },
    -- You can also import plugins from a specific file
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "dragon" } },
  -- automatically check for plugin updates (notifications disabled to prevent intrusive prompts)
  checker = { 
    enabled = true,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = false,  -- Disable notifications that pause your buffer
    frequency = 3600, -- Check only once per hour instead of constantly
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- Disable notifications for config changes (this was the main culprit!)
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
    },
  }
})
