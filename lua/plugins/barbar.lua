return {
    {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = true,
      insert_at_start = true,
      -- …etc.
    },
    config = function()
      -- Set up keybindings after barbar is loaded
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      
      -- Disable conflicting cursor movement keybindings
      map('n', '<C-S-Left>', '<Nop>', opts)   -- Disable word jump left
      map('n', '<C-S-Right>', '<Nop>', opts)  -- Disable word jump right
      map('v', '<C-S-Left>', '<Nop>', opts)   -- Disable in visual mode too
      map('v', '<C-S-Right>', '<Nop>', opts)  -- Disable in visual mode too
      map('i', '<C-S-Left>', '<Nop>', opts)   -- Disable in insert mode
      map('i', '<C-S-Right>', '<Nop>', opts)  -- Disable in insert mode
      
      -- Now map to buffer navigation
      map('n', '<C-S-Left>', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<C-S-Right>', '<Cmd>BufferNext<CR>', opts)
    end,
    version = '^1.0.0',
  },
}