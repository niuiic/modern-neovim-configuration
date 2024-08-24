return {
	config = function()
		require("yazi").setup({
			keymaps = {
				show_help = "?",
			},
		})
	end,
	keys = {
		{
			"<C-p>",
			"<cmd>Yazi<cr>",
		},
	},
}
