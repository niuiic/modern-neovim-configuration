local utils = require("utils")

vim.notify = require("notify")

require("notify").setup({
	background_colour = "#37383a",
	timeout = 1,
})

require("noice").setup({
	messages = {
		view = "mini",
	},
	lsp = {
		hover = {
			opts = { border = "single" },
		},
	},
})

vim.api.nvim_set_hl(0, "MsgArea", { bg = "#262728" })
