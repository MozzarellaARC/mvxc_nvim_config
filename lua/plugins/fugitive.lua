return {
  -- Git integration for Neovim with GitHub support
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
    ft = { "fugitive" },

    keys = {
      { "<leader>gd", ":vert Gdiffsplit<CR>", desc = "Git diff split" },
      { "<leader>gs", "<Cmd>Git<CR>", desc = "Git Status" },
      { "<leader>gg", function()
          local commit_msg = vim.fn.input("Commit message: ")
          if commit_msg ~= "" then
            vim.cmd("Git add .")
            vim.cmd("Git commit -m '" .. commit_msg .. "'")
          end
        end, desc = "Add, commit and push" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push" },

    },
    dependencies = {
    },
    config = function()
    end,
  },
}
