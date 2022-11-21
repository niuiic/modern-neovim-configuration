local utils = require("utils")

vim.notify = utils.fn.require("notify")

utils.fn.require("notify").setup({
	background_colour = "#37383a",
})

utils.fn.require("noice").setup({
	messages = {
		view = "mini",
	},
})

vim.api.nvim_set_hl(0, "MsgArea", { bg = "#262728" })
