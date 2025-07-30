local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local rmap = { noremap = false, silent = true }

---General keybindings
map('n', 'z', 'u', opts)  -- undo with z
map('n', 'Z', '<C-r>', opts)  -- Redo with Shift+z
map('n', '<C-s>', ':w<CR>', opts) -- Save with Ctrl+s
map('n', '<C-A-s>', ':wa<CR>', opts) -- Save all buffers with Ctrl+Alt+s

--- Fugitive keybindings
map("n", "<leader>gs", ":Git<CR>", opts)
map("n", "<leader>gd", ":Gdiffsplit<CR>", opts)
map("n", "<leader>gc", ":Git commit<CR>", opts)
map("n", "<leader>gp", ":Git push<CR>", opts)
map("n", "<leader>gl", ":Git pull<CR>", opts)
map("n", "<leader>gb", ":Git blame<CR>", opts)
map("n", "<leader>gh", ":GBrowse<CR>", opts)
map("v", "<leader>gh", ":GBrowse<CR>", opts)

-- Set up keybindings after barbar is loaded
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

--- Yazi keybindings
map('n', '<space>f', '<Cmd>Yazi<CR>', opts)  -- Open yazi at current file
map('n', '<leader>cw', '<Cmd>Yazi cwd<CR>', opts)  -- Open yazi in working directory

--- Buffer management
-- Close all buffers except those visible in windows/tabs
vim.api.nvim_create_user_command('BufCleanup', function()
  local visible_buffers = {}
  
  -- Get all visible buffers from all tabs and windows
  for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
      local buf = vim.api.nvim_win_get_buf(win)
      visible_buffers[buf] = true
    end
  end
  
  -- Close all buffers that aren't visible
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and not visible_buffers[buf] then
      local buf_type = vim.api.nvim_buf_get_option(buf, 'buftype')
      local buf_name = vim.api.nvim_buf_get_name(buf)
      -- Only close normal file buffers (not special buffers like terminals, etc.)
      if buf_type == '' and buf_name ~= '' then
        vim.api.nvim_buf_delete(buf, { force = false })
      end
    end
  end
  
  print("Cleaned up hidden buffers")
end, { desc = "Close all buffers not visible in any window" })

-- Map :bd to our custom buffer cleanup command
map('n', '<leader>bd', '<Cmd>BufCleanup<CR>', opts)  -- Clean up hidden buffers

