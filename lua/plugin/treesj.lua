return {
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})
	end,
	keys = {
		{
			"<C-y>",
			function()
				require("treesj").toggle()
			end,
			desc = "split/join function",
		},
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
