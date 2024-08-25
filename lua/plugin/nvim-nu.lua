return {
	config = function()
		require("nu").setup({
			use_lsp_features = false,
		})
	end,
	build = function()
		vim.cmd("TSInstall nu")
	end,
}
