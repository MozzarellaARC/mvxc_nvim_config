return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			border = "default",
			render = "default",
			stages = "static",
			timeout = 3000,
			top_down = false,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		})
		vim.notify = require("notify")
	end
}
