return {
	config = function()
		require("local-highlight").setup({
			animate = {
				enabled = false,
			},
		})
	end,
	dependencies = { "folke/snacks.nvim" },
}
