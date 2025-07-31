return {
    'tummetott/unimpaired.nvim',
    event = 'VeryLazy',
    config = function()
        require('unimpaired').setup {
            keymaps = {
                -- To overwrite the mapping, keymap description and dot-repetition for
                -- ':bnext', write
                bnext = {
                    mapping = '<leader>n',
                    description = 'Go to [count] next buffer',
                    dot_repeat = true,
                },

                -- To disable dot repetition for ':bprevious', write
                bprevious = {
                    mapping = '<leader>p',
                    description = 'Go to [count] previous buffer',
                    dot_repeat = false,
                },

                -- If you just want to change the keymap for ':bfirst' and don't care
                -- about description and dot-repetition, write the shorthand
                bfirst = '<leader>N',

                -- To disable the keymap ':blast' completely, set it to false
                blast = false,
            },

            -- Disable the default mappings if you prefer to define your own mappings
            default_keymaps = false,
        }
    end,
}
