local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- -- Enable extended key protocol for better terminal key recognition
-- vim.opt.timeout = true
-- vim.opt.timeoutlen = 300

-- Disable default keybindings
map({ 'n', 'i', 'v' }, '<C-r>', '<Nop>')
map({'n', 'v'}, 'h', '<Nop>', opts)
map({'n', 'v'}, 'j', '<Nop>', opts)
map({'n', 'v'}, 'k', '<Nop>', opts)
map({'n', 'v'}, 'l', '<Nop>', opts)
map({'n', 'v'}, 'Q', '<Nop>', opts)

-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS

-- This to PowerShell Settings
--    {
--             "command": 
--             {
--                 "action": "sendInput",
--                 "input": "\u001b[90;5u"
--             },
--             "id": "User.sendInput.D77F01E1"
--         },

-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS

---General keybindings
map('n', 'z', 'u', opts)  -- undo with z
map('n', '<C-S-z>', '<C-r>', opts)  -- Redo with Shift+z

map('n', '<C-s>', ':w<CR>', {noremap = true, nowait = true}) -- Save with Ctrl+s
map('i', '<C-s>', '<Esc>:w<CR>', {noremap = true, nowait = true}) -- Save with Ctrl+s
map('v', '<C-s>', '<Esc>:w<CR>', {noremap = true, nowait = true}) -- Save with Ctrl+s
-- map('n', '<C-S>s', ':wa<CR>', opts) -- Save all buffers with Ctrl+Alt+s If this is turned on, it will gives delays to the Ctrl+s keybinding

map('n', '<F4>', ':qa!<CR>', opts) -- Exit Neovim
map('v', '<C-c>', 'y', opts) -- Copy selection with Ctrl+c

--- Fugitive keybindings
map("n", "<leader>gs", ":Git<CR>", opts)
map("n", "<leader>gd", ":Gdiffsplit<CR>", opts)
map("n", "<leader>gc", ":Git commit<CR>", opts)
map("n", "<leader>gp", ":Git push<CR>", opts)
map("n", "<leader>gl", ":Git pull<CR>", opts)
map("n", "<leader>gb", ":Git blame<CR>", opts)
map("n", "<leader>gh", ":GBrowse<CR>", opts)
map("v", "<leader>gh", ":GBrowse<CR>", opts)

-- Barbar keybindings
map('n', '<C-S-Left>', '<Nop>', opts)   -- Disable word jump left in normal mode
map('i', '<C-S-Left>', '<Nop>', opts)   -- Disable word jump left in insert mode
map('v', '<C-S-Left>', '<Nop>', opts)   -- Disable word jump left in visual mode
map('n', '<C-S-Right>', '<Nop>', opts)  -- Disable word jump right in normal mode
map('i', '<C-S-Right>', '<Nop>', opts)  -- Disable word jump right in insert mode
map('v', '<C-S-Right>', '<Nop>', opts)  -- Disable word jump right in visual mode

--this is just a test
--here is another test

-- Now map to buffer navigation
-- map('n', '<C-S-Left>', '<Cmd>BufferPrevious<CR>', opts)
-- map('n', '<C-S-Right>', '<Cmd>BufferNext<CR>', opts)

-- map('n', '<C-S-Left>', '<Cmd>bpref<CR>', opts)
-- map('n', '<C-S-Right>', '<Cmd>bnext<CR>', opts)

-- Buffer navigation keybindings
map('n', '<Tab>', ':wincmd w<CR>', { noremap = true, silent = true })

-- Indentation keybindings
map('n', '<C-,>', '<<', { noremap = true, silent = true })
map('n', '<C-.>', '>>', { noremap = true, silent = true })

map('i', '<C-,>', '<C-d>', { noremap = true, silent = true })
map('i', '<C-.>', '<C-t>', { noremap = true, silent = true })

map('v', '<C-,>', '<gv', { noremap = true, silent = true })
map('v', '<C-.>', '>gv', { noremap = true, silent = true })

-- Commentation keybindings
map('n', '<A-/>', 'gcc', { noremap = true, silent = true })

map('v', '<A-/>', 'gcgv', { noremap = true, silent = true })

map('i', '<A-/>', '<Esc>gcc<CR>i', { noremap = false, silent = true })

--- Yazi keybindings
map('n', '<space><space>', '<Cmd>Yazi<CR>', opts)  -- Open yazi at current file
map('v', '<space><space>', '<Cmd>Yazi<CR>', opts)  -- Open yazi at current file
map('n', '<space>cw', '<Cmd>Yazi cwd<CR>', opts)  -- Open yazi in working directory


-- Directory tree keybindings
map('n', '<F1>', '<Cmd>Neotree toggle<CR>', opts)  -- Open yazi in current file
map('v', '<F1>', '<Cmd>Neotree toggle<CR>', opts)  -- Open yazi in current file

map('n', '<F2>', function() _G.undotree_toggle() end, { desc = "Toggle Undotree" })  -- Toggle undotree
map('v', '<F2>', function() _G.undotree_toggle() end, { desc = "Toggle Undotree" })  -- Toggle undotree

map('n', '<F3>', '<cmd>Trouble diagnostics toggle<cr>', opts)
map('v', '<F3>', '<cmd>Trouble diagnostics toggle<cr>', opts)

-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS

-- Override the entire C-w prefix with conditional behavior
map('n', '<C-w>', function()
  -- Get the number of windows in current tab
  local win_count = vim.fn.winnr('$')
  -- Also check if current window is the last "normal" window
  -- (excluding special windows like quickfix, help, etc.)
  local current_win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(current_win)
  local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
  if win_count > 1 and buftype == '' then
    -- Multiple windows and current is a normal buffer: close current window
    local ok= pcall(function()vim.cmd('close') end)
    if not ok then
      -- If close fails, fallback to deleting buffer
      vim.cmd('bd')
    end
  else
    -- Single window or special buffer type: delete buffer
    vim.cmd('bd')
  end
end, {noremap = true, nowait = true})

-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
