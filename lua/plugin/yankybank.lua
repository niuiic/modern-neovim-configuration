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
