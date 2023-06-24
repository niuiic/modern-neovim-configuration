return {
	priority = 1001,
	config = function()
		require("flatten").setup({
			window = {
				open = "alternate",
			},
		})
	end,
}
