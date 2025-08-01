return {
  {
    'mbbill/undotree',
    config = function()
      -- Enable persistent undo
      vim.opt.undofile = true
      
      -- Set undodir with proper path handling
      local undodir = vim.fn.stdpath('data') .. '/undodir'
      vim.opt.undodir = undodir
      
      -- Create undodir if it doesn't exist
      if vim.fn.isdirectory(undodir) == 0 then
        vim.fn.mkdir(undodir, 'p')
      end
      
      -- Configure swap file settings to avoid conflicts
      vim.opt.swapfile = true
      local swapdir = vim.fn.stdpath('data') .. '/swap'
      vim.opt.directory = swapdir
      
      -- Create swapdir if it doesn't exist
      if vim.fn.isdirectory(swapdir) == 0 then
        vim.fn.mkdir(swapdir, 'p')
      end
      
      -- Set backup directory as well for consistency
      local backupdir = vim.fn.stdpath('data') .. '/backup'
      vim.opt.backupdir = backupdir
      vim.opt.backup = true
      
      -- Create backupdir if it doesn't exist
      if vim.fn.isdirectory(backupdir) == 0 then
        vim.fn.mkdir(backupdir, 'p')
      end
      
      -- Undotree specific settings
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_ShortIndicators = 1
      vim.g.undotree_SetFocusWhenToggle = 1
      
      -- Simple function to toggle undotree
      local function safe_undotree_toggle()
        vim.cmd.UndotreeToggle()
      end
      
      -- Set up the keymap
      vim.keymap.set('n', '<leader>z', safe_undotree_toggle, { desc = "Toggle Undotree" })
      vim.keymap.set('v', '<leader>z', safe_undotree_toggle, { desc = "Toggle Undotree" })
    end,
  }
}
