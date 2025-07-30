return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- Disable default tab mapping to avoid conflicts
    vim.g.copilot_no_tab_map = true
    
    -- Set up key mappings for accepting suggestions
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      silent = true
    })
    
    -- Optional: Set up additional keymaps
    vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)', { silent = true })
    vim.keymap.set('i', '<C-H>', '<Plug>(copilot-dismiss)', { silent = true })
    
    -- Enable copilot for specific filetypes (optional)
    vim.g.copilot_filetypes = {
      ["*"] = true,
    }
  end,
}
