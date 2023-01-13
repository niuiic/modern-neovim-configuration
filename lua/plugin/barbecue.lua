return {
	config = function()
		require("barbecue").setup({})
	end,
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
	},
}
