local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "i", "v" }, "<C-.>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<C-S-.>", "<Nop>")

map('n', 'h', '<Nop>', opts)
map('n', 'j', '<Nop>', opts)
map('n', 'k', '<Nop>', opts)
map('n', 'l', '<Nop>', opts)

-- Override the entire C-w prefix
vim.keymap.set('n', '<C-w>', ':bd<CR>', {noremap = true, nowait = true})


---General keybindings
map('n', 'z', 'u', opts)  -- undo with z
map('n', 'Z', '<C-r>', opts)  -- Redo with Shift+z
map('n', '<C-s>', ':w<CR>', opts) -- Save with Ctrl+s
map('n', '<C-M-s>', ':wa<CR>', opts) -- Save all buffers with Ctrl+Alt+s

map('n', '<M-w>', ':bd<CR>', opts) -- Close current buffer
map('n', '<S-q>', ':qa!<CR>', opts) -- Exit Neovim
map('v', '<C-c>', 'y', opts)

--- Fugitive keybindings
map("n", "<leader>gs", ":Git<CR>", opts)
map("n", "<leader>gd", ":Gdiffsplit<CR>", opts)
map("n", "<leader>gc", ":Git commit<CR>", opts)
map("n", "<leader>gp", ":Git push<CR>", opts)
map("n", "<leader>gl", ":Git pull<CR>", opts)
map("n", "<leader>gb", ":Git blame<CR>", opts)
map("n", "<leader>gh", ":GBrowse<CR>", opts)
map("v", "<leader>gh", ":GBrowse<CR>", opts)

-- test

-- Set up keybindings after barbar is loaded
-- Disable conflicting cursor movement keybindings
map('n', '<C-S-Left>', '<Nop>', opts)   -- Disable word jump left in normal mode
map('i', '<C-S-Left>', '<Nop>', opts)   -- Disable word jump left in insert mode
map('v', '<C-S-Left>', '<Nop>', opts)   -- Disable word jump left in visual mode
map('n', '<C-S-Right>', '<Nop>', opts)  -- Disable word jump right in normal mode
map('i', '<C-S-Right>', '<Nop>', opts)  -- Disable word jump right in insert mode
map('v', '<C-S-Right>', '<Nop>', opts)  -- Disable word jump right in visual mode

-- Now map to buffer navigation
map('n', '<C-S-Left>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-S-Right>', '<Cmd>BufferNext<CR>', opts)

--- Yazi keybindings
map('n', '<space>f', '<Cmd>Yazi<CR>', opts)  -- Open yazi at current file
map('n', '<leader>cw', '<Cmd>Yazi cwd<CR>', opts)  -- Open yazi in working directory
