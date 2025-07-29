return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  -- Optional: set up keymaps
  keys = {
    { "<space><space>", "<cmd>FzfLua files<cr>", desc = "FzfLua: Find Files" },
    { "<space>-", "<cmd>FzfLua live_grep<cr>", desc = "FzfLua: Live Grep" },
  },
}
