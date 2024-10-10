return {
	config = function()
		require("nu").setup({
			use_lsp_features = false,
		})
	end,
	build = ":TSInstall nu",
}
