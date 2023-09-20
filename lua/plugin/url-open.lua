return {
	config = function()
		require("url-open").setup({})
	end,
	keys = {
		{
			"<leader>o",
			"<cmd>OpenUrlUnderCursor<CR>",
			desc = "open url",
		},
	},
}
