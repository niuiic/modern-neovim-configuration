local config = function()
	vim.notify = require("notify")

	require("notify").setup({
		background_colour = "#37383a",
		timeout = 1,
	})

	require("noice").setup({
		messages = {
			view = "mini",
		},
	})

	vim.api.nvim_set_hl(0, "MsgArea", { bg = "#262728" })
end

return {
	config = config,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	event = "VimEnter",
}
