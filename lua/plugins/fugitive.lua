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
          local notify = require('config.notify')
          -- Check if there are changes to commit
          local result = vim.fn.system("git status --porcelain")
          if result == "" then
            notify.git.error("No changes to commit")
            return
          end
          -- Non-blocking commit with default message
          vim.cmd("silent Git add .")
          vim.cmd("silent Git commit -m 'whatever'")
          notify.git.success("Committed with 'whatever'")
        end, desc = "Quick add and commit" },
      { "<leader>gc", function()
          local notify = require('config.notify')
          -- Check if there are changes to commit
          local result = vim.fn.system("git status --porcelain")
          if result == "" then
            notify.git.error("No changes to commit")
            return
          end
          -- Custom commit message using command line
          vim.ui.input({ prompt = "Commit message: " }, function(input)
            if input and input ~= "" then
              vim.cmd("silent Git add .")
              vim.cmd("silent Git commit -m '" .. input .. "'")
              notify.git.success("Committed: " .. input)
            else
              notify.git.error("Commit cancelled")
            end
          end)
        end, desc = "Add and commit with custom message" },
      { "<leader>gp", function()
          local notify = require('config.notify')
          -- Push to remote
          vim.cmd("silent Git push")
          notify.git.success("Pushed to remote")
        end, desc = "Git push" },
-- test man
    },
    dependencies = {
    },
    config = function()
    end,
  },
}
