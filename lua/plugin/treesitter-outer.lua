return {
	config = function()
		require("treesitter-outer").setup({
			prev_outer_key = "go",
			next_outer_key = "gO",
		})
	end,
	dependencies = "nvim-treesitter/nvim-treesitter",
}
