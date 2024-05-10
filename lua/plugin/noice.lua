local config = function()
	vim.notify = require("notify")

	require("notify").setup({
		background_colour = "#00000000",
		timeout = 1,
	})

	require("noice").setup({
		messages = {
			view = "mini",
		},
		views = {
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		},
	})

	vim.api.nvim_set_hl(0, "NoiceFormatProgressTodo", { fg = "#262728" })
	vim.api.nvim_set_hl(0, "NoiceFormatProgressDone", { bg = "#00ffff" })
end

return {
	config = config,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	event = "VimEnter",
}
