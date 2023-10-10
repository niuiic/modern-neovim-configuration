return {
	config = function()
		require("url-open").setup({})
	end,
	keys = {
		{
			"<leader>o",
			"<cmd>URLOpenUnderCursor<CR>",
			desc = "open url",
		},
	},
}
