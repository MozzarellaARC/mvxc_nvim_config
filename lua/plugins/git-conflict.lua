-- lazy.nvim
return {
	'akinsho/git-conflict.nvim',
	version = "*",
	event = "BufReadPre",
	config = function()
		require('git-conflict').setup({
			default_mappings = {
				ours = 'co',
				theirs = 'ct',
				none = 'c0',
				both = 'cb',
				next = ']x',
				prev = '[x',
			},
			default_commands = true, -- disable commands created by this plugin
			default_highlights = true, -- disable highlights created by this plugin
			disable_diagnostics = false, -- disable diagnostics in conflict regions
			list_opener = 'copen', -- command or function to open the conflicts list
			highlights = { -- They must have background color, otherwise the default color will be used
				incoming = 'DiffAdd',
				current = 'DiffText',
			}
		})

		-- Additional keymaps for conflict resolution
		vim.keymap.set('n', '<leader>gco', '<Plug>(git-conflict-ours)', { desc = 'Choose ours (current branch)' })
		vim.keymap.set('n', '<leader>gct', '<Plug>(git-conflict-theirs)', { desc = 'Choose theirs (incoming branch)' })
		vim.keymap.set('n', '<leader>gcb', '<Plug>(git-conflict-both)', { desc = 'Choose both changes' })
		vim.keymap.set('n', '<leader>gc0', '<Plug>(git-conflict-none)', { desc = 'Choose none (delete conflict)' })
		vim.keymap.set('n', '<leader>gcn', '<Plug>(git-conflict-next-conflict)', { desc = 'Next conflict' })
		vim.keymap.set('n', '<leader>gcp', '<Plug>(git-conflict-prev-conflict)', { desc = 'Previous conflict' })
		vim.keymap.set('n', '<leader>gcl', ':GitConflictListQf<CR>', { desc = 'List conflicts in quickfix' })
		vim.keymap.set('n', '<leader>gcr', ':GitConflictRefresh<CR>', { desc = 'Refresh conflict detection' })

		-- Auto-open conflict list when conflicts are detected
		vim.api.nvim_create_autocmd("User", {
			pattern = "GitConflictDetected",
			callback = function()
				vim.notify("Git conflicts detected!", vim.log.levels.WARN)
			end,
		})
	end,
}
