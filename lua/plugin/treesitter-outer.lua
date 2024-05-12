return {
	config = function()
		require("treesitter-outer").setup({
			prev_outer_key = "{",
			next_outer_key = "}",
		})
	end,
	dependencies = "nvim-treesitter/nvim-treesitter",
}
