local map = vim.keymap.set

-- Enable extended key protocol for better terminal key recognition
-- vim.opt.timeout = true
-- vim.opt.timeoutlen = 300

-- Disable default keybindings
map({ 'n', 'i', 'v' }, '<C-r>', '<Nop>')
map({'n', 'v'}, 'h', '<Nop>')
map({'n', 'v'}, 'j', '<Nop>')
map({'n', 'v'}, 'k', '<Nop>')
map({'n', 'v'}, 'l', '<Nop>')
map({'n', 'v'}, 'Q', '<Nop>')



-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
--
-- This to PowerShell Settings
--    {
--             "command": 
--             {
--                 "action": "sendInput",
--                 "input": "\u001b[90;5u"
--             },
--             "id": "User.sendInput.CtrlShiftZ"
--         },
--    {
--             "command": 
--             {
--                 "action": "sendInput",
--                 "input": "\u001b[44;5u"
--             },
--             "id": "User.sendInput.CtrlComma"
--         },
--    {
--             "command": 
--             {
--                 "action": "sendInput",
--                 "input": "\u001b[46;5u"
--             },
--             "id": "User.sendInput.CtrlPeriod"
--         },
--    {
--             "command": 
--             {
--                 "action": "sendInput",
--                 "input": "\u001b[47;5u"
--             },
--             "id": "User.sendInput.CtrlSlash"
--         }
-- --
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS
-- IONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUU
-- FUNCTIONS, FUNCTIOS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS, FUNCTIONS

---General keybindings
map('n', 'z', 'u')  -- undo with z
map('n', '<C-S-z>', '<C-r>')  -- Redo with Shift+z

map('n', '<C-s>', ':w<CR>') -- Save with Ctrl+s
map('i', '<C-s>', '<Esc>:w<CR>') -- Save with Ctrl+s
map('v', '<C-s>', '<Esc>:w<CR>') -- Save with Ctrl+s
-- map('n', '<C-S>s', ':wa<CR>') -- Save all buffers with Ctrl+Alt+s If this is turned on, it will gives delays to the Ctrl+s keybinding

map('n', '<F4>', ':qa!<CR>') -- Exit Neovim
map('v', '<C-c>', 'y') -- Copy selection with Ctrl+c

--- Fugitive keybindings
-- map("n", "<leader>gs", ":Git<CR>")
-- map("n", "<leader>gd", ":Gdiffsplit<CR>")
-- map("n", "<leader>gc", ":Git commit<CR>")
-- map("n", "<leader>gp", ":Git push<CR>")
-- map("n", "<leader>gl", ":Git pull<CR>")
-- map("n", "<leader>gb", ":Git blame<CR>")
-- map("n", "<leader>gh", ":GBrowse<CR>")
-- map("v", "<leader>gh", ":GBrowse<CR>")

-- Buffer navigation keybindings
map('n', '<Tab>', ':wincmd w<CR>')

-- Indentation keybindings
map('n', '<C-,>', '<<')
map('n', '<C-.>', '>>')

map('i', '<C-,>', '<C-d>')
map('i', '<C-.>', '<C-t>')

map('v', '<C-,>', '<gv')
map('v', '<C-.>', '>gv')

-- Comment-out keybindings
map('n', '<C-/>', '<Cmd>normal gcc<CR>', { silent = true })
map('v', '<C-/>', '<Cmd>normal gcgv<CR>', { silent = true })
map('i', '<C-/>', '<Esc><Cmd>normal gcc<CR>i', { silent = true })

--- Yazi keybindings
map('n', '<space><space>', '<Cmd>Yazi<CR>')  -- Open yazi at current file
map('v', '<space><space>', '<Cmd>Yazi<CR>')  -- Open yazi at current file
map('n', '<space>cw', '<Cmd>Yazi cwd<CR>')  -- Open yazi in working directory


-- Directory tree keybindings
map('n', '<F1>', '<Cmd>Neotree toggle<CR>')  -- Open yazi in current file
map('v', '<F1>', '<Cmd>Neotree toggle<CR>')  -- Open yazi in current file

map('n', '<F2>', function() _G.undotree_toggle() end, { desc = "Toggle Undotree" })  -- Toggle undotree
map('v', '<F2>', function() _G.undotree_toggle() end, { desc = "Toggle Undotree" })  -- Toggle undotree

map('n', '<F3>', '<cmd>Trouble diagnostics toggle<cr>')
map('v', '<F3>', '<cmd>Trouble diagnostics toggle<cr>')

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
  local buftype = vim.bo[buf].buftype
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
