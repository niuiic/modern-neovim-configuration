vim.cmd(
	[[autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=500}]]
)

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
}
