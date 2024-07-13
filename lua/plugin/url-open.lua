return {
	config = function()
		require("url-open").setup({})
	end,
	keys = {
		{
			"<leader>o",
			"<cmd>URLOpenUnderCursor<cr>",
			desc = "open url",
		},
	},
}
