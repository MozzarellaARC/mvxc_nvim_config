return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
	local presets2 ={
		theme = "dropdown",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
		 width = math.min(vim.o.columns, 140),
		 height = math.min(vim.o.lines, 20),
		}
	}
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key"
          }
        }
      },
      pickers = {
        -- You can customize pickers here
		find_files = {
			presets2
		},
		live_grep = {
			presets2
		},
		buffers = {
			presets2
		},
		help_tags = {
			presets2
		}
      },
      extensions = {
        -- You can configure extensions here
      }
    })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Telescope help tags' })
  end
}

