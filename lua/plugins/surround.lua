return {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
		require("nvim-surround").setup(
        )
    end,
	vim.keymap.set("n", "s", "<Plug>(nvim-surround-normal)iw", { noremap = true, silent = true}),
	vim.keymap.set("v", "s", "<Plug>(nvim-surround-visual)", { noremap = true, silent = true})
}

-- 3.1. Keymaps                                    *nvim-surround.config.keymaps*
--
-- The `keymaps` table defines the keymaps used to perform surround actions. The
-- general rule is that if the key ends in "_line", the delimiter pair is added
-- on new lines. If the key ends in "_cur", the surround is performed around the
-- current line.
--
-- The default configuration is as follows:
-- >lua
--     keymaps = {
--         insert = "<C-g>s",
--         insert_line = "<C-g>S",
--         normal = "ys",
--         normal_cur = "yss",
--         normal_line = "yS",
--         normal_cur_line = "ySS",
--         visual = "S",
--         visual_line = "gS",
--         delete = "ds",
--         change = "cs",
--         change_line = "cS",
--     },
-- <
--
-- Additionally, there is a corresponding set of |<Plug>| mappings that one may
-- use to set up their own custom keymaps:
-- >vim
--     <Plug>(nvim-surround-insert)
--     <Plug>(nvim-surround-insert-line)
--     <Plug>(nvim-surround-normal)
--     <Plug>(nvim-surround-normal-cur)
--     <Plug>(nvim-surround-normal-line)
--     <Plug>(nvim-surround-normal-cur-line)
--     <Plug>(nvim-surround-visual)
--     <Plug>(nvim-surround-visual-line)
--     <Plug>(nvim-surround-delete)
--     <Plug>(nvim-surround-change)
--     <Plug>(nvim-surround-change-line)
-- <
