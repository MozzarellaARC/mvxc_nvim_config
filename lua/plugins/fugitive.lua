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
      
    end,
  },
}
