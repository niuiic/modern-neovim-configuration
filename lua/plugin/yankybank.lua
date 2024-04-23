vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		local higroup = vim.fn.hlexists("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"
		vim.highlight.on_yank({ higroup = higroup, timeout = 500 })
	end,
})

return {
	config = function()
		require("yankbank").setup({})
	end,
	keys = {
		{
			"<space>oy",
			"<cmd>YankBank<CR>",
			desc = "yank history",
		},
	},
	lazy = false,
}
