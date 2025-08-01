return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        sources = { "filesystem", "buffers", "git_status" },
        source_selector = {
          winbar = true, -- Show tabs in the window bar
          statusline = false,
          show_scrolled_off_parent_node = true,
          sources = {
            { source = "filesystem", display_name = " 󰉓 Files " },
            { source = "buffers", display_name = " 󰈚 Buffers " },
            { source = "git_status", display_name = " 󰊢 Git " },
          },
        },
        enable_git_status = true,
        enable_diagnostics = true,
        filesystem = {
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
          hijack_netrw_behavior = "open_current", -- Enable single click behavior
        },
        window = {
          position = "left",
          width = 30,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<cr>"] = "open",
            ["<2-LeftMouse>"] = "open", -- Double click still works
            ["<LeftRelease>"] = "open", -- Single click to open files
          },
        },
        default_component_configs = {
          indent = {
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            default = "󰈙",
          },
          git_status = {
            symbols = {
              added     = "✚",
              modified  = "",
              deleted   = "✖",
              renamed   = "󰁕",
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            },
          },
        },
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })
    end,
  }
}
