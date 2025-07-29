return {
  -- Git integration for Neovim with GitHub support
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
    ft = { "fugitive" },
    dependencies = {
      "tpope/vim-rhubarb", -- GitHub integration for fugitive
    },
    config = function()
      -- Optional: Add custom keymaps for fugitive
      vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
      vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff" })
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
      vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { desc = "Git pull" })
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })
      vim.keymap.set("n", "<leader>gh", ":GBrowse<CR>", { desc = "Open in GitHub" })
      vim.keymap.set("v", "<leader>gh", ":GBrowse<CR>", { desc = "Open selection in GitHub" })
    end,
  },
}
