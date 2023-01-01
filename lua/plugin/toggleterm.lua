return {
	config = function()
		require("toggleterm").setup({
			size = 15,
			open_mapping = "<C-z>",
			direction = "horizontal",
		})
	end,
	keys = {
		{ "<C-z>", "<cmd>ToggleTerm<CR>" },
	},
}
