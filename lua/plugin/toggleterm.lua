return {
	config = function()
		require("toggleterm").setup({
			open_mapping = "<C-z>",
			direction = "float",
		})
	end,
	keys = {
		{ "<C-z>", "<cmd>ToggleTerm<CR>" },
	},
}
