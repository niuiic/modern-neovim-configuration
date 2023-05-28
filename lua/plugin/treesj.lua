return {
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})
	end,
	keys = {
		{
			"<leader>f",
			function()
				require("treesj").toggle()
			end,
			desc = "split/join function",
		},
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
