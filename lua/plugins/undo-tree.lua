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
      
      -- Simple function to toggle undotree (no LSP interference needed)
      local function safe_undotree_toggle()
        vim.cmd.UndotreeToggle()
      end
      
      -- Set up the keymap
      vim.keymap.set('n', '<leader>z', safe_undotree_toggle, { desc = "Toggle Undotree" })
      vim.keymap.set('v', '<leader>z', safe_undotree_toggle, { desc = "Toggle Undotree" })
    end,
  }
}
