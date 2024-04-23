return {
	config = function()
		require("scrollofffraction").setup({
			scrolloff_fraction = 0.4,
			scrolloff_absolute_filetypes = { "qf", "markdown" },
			scrolloff_absolute_value = 5,
		})
	end,
}
