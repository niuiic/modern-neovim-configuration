return {
	config = function()
		require("smartcolumn").setup({
			disabled_filetypes = {
				"lazy",
			},
			colorcolumn = "120",
			custom_colorcolumn = {
				vue = "160",
			},
		})
	end,
}
