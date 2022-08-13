local utils = require("utils")

utils.fn.require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.cmd("set spell")
		vim.cmd("syntax on")
	end,
})
