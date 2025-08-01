return {
  {
    'mbbill/undotree',
    config = function()
      -- Enable persistent undo
      vim.opt.undofile = true
      vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
      
      -- Create undodir if it doesn't exist
      local undodir = vim.fn.expand('~/.vim/undodir')
      if vim.fn.isdirectory(undodir) == 0 then
        vim.fn.mkdir(undodir, 'p')
      end

      -- Set up the keymap
      vim.keymap.set('n', '<leader>z', vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
    end,
  }
}
