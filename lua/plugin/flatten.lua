return {
	priority = 1001,
	config = function()
		require("flatten").setup({
			window = {
				open = "alternate",
			},
			nest_if_no_args = true,
		})
	end,
}
