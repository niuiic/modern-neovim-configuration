return {
	config = function()
		require("lazydev").setup({
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		})
	end,
	ft = "lua",
	dependencies = { "Bilal2453/luvit-meta" },
}
