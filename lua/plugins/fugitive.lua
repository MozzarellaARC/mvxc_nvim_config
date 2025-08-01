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
          -- Non-blocking commit with default message
          vim.cmd("Git add .")
          vim.cmd("Git commit -m 'whatever'")
          vim.notify("✓ Committed with 'whatever'", vim.log.levels.INFO)
        end, desc = "Quick add and commit" },
      { "<leader>gc", function()
          -- Custom commit message using command line
          vim.ui.input({ prompt = "Commit message: " }, function(input)
            if input and input ~= "" then
              vim.cmd("Git add .")
              vim.cmd("Git commit -m '" .. input .. "'")
              vim.notify("✓ Committed: " .. input, vim.log.levels.INFO)
            else
              vim.notify("✗ Commit cancelled", vim.log.levels.WARN)
            end
          end)
        end, desc = "Add and commit with custom message" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push" },
-- test man
    },
    dependencies = {
    },
    config = function()
    end,
  },
}
