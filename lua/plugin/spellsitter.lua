require("spellsitter").setup({ enable = { "markdown" } })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.md" },
	callback = function()
		vim.cmd([[set spell]])
		vim.cmd([[syntax on]])
	end,
})
