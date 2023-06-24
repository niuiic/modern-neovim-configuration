return {
	config = function()
		require("neodev").setup({
			library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
		})
	end,
}
