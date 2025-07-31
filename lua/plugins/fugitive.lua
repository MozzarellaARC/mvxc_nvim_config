return {
  -- Git integration for Neovim with GitHub support
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
    ft = { "fugitive" },
    keys = {
      { "<leader>gd", ":vert Gdiffsplit<CR>", desc = "Git diff split" },
      { "<leader>gs", "<Cmd>Git<CR>", desc = "Git Status" },
    },
    dependencies = {
    },
    config = function()
    end,
  },
}
