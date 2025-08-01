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
          if commit_msg == "" then
            commit_msg = "whatever"
            vim.notify("Using default commit message: 'whatever'", vim.log.levels.INFO)
          else
            vim.notify("Committing with message: '" .. commit_msg .. "'", vim.log.levels.INFO)
          end
          

		  -test 4
          -- Add all files
          vim.cmd("Git add .")
          vim.notify("Files staged for commit", vim.log.levels.INFO)
          
          -- Commit with message
          local success, result = pcall(function()
            vim.cmd("Git commit -m '" .. commit_msg .. "'")
          end)
          
          if success then
            vim.notify("Commit successful!", vim.log.levels.INFO)
          else
            vim.notify("Commit failed: " .. tostring(result), vim.log.levels.ERROR)
          end
        end, desc = "Add, commit with notifications" },
      { "<leader>gp", function()
          vim.notify("Pushing to remote...", vim.log.levels.INFO)
          local success, result = pcall(function()
            vim.cmd("Git push")
          end)
          
          if success then
            vim.notify("Push successful!", vim.log.levels.INFO)
          else
            vim.notify("Push failed: " .. tostring(result), vim.log.levels.ERROR)
          end
        end, desc = "Git push with notifications" },
      { "<leader>gq", function()
          -- Quick commit with timestamp - no input prompt needed
          local timestamp = os.date("%Y-%m-%d %H:%M:%S")
          local commit_msg = "Quick commit: " .. timestamp
          
          vim.notify("Quick committing with timestamp...", vim.log.levels.INFO)
          
          -- Add all files
          vim.cmd("Git add .")
          vim.notify("Files staged for commit", vim.log.levels.INFO)
          
          -- Commit with timestamp message
          local success, result = pcall(function()
            vim.cmd("Git commit -m '" .. commit_msg .. "'")
          end)
          
          if success then
            vim.notify("Quick commit successful: " .. commit_msg, vim.log.levels.INFO)
          else
            vim.notify("Quick commit failed: " .. tostring(result), vim.log.levels.ERROR)
          end
        end, desc = "Quick commit with timestamp (no prompt)" },
    },
    dependencies = {
    },
    config = function()
    end,
  },
}
