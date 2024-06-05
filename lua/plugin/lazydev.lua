return {
	config = function()
		require("lazydev").setup({
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				{ path = "niuiic/core.nvim", words = { [[require("core")]] } },
			},
		})
	end,
	ft = "lua",
	dependencies = { "Bilal2453/luvit-meta" },
}
