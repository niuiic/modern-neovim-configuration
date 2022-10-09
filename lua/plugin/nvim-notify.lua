local utils = require("utils")

vim.notify = utils.fn.require("notify")

utils.fn.require("notify").setup({
	background_colour = "#37383a",
})
