return {
	config = function()
		require("lazydev").setup({
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				{ path = "xmake-luals-addon/library", files = { "xmake.lua" } },
			},
		})
	end,
	ft = "lua",
	dependencies = { "Bilal2453/luvit-meta", "LelouchHe/xmake-luals-addon" },
}
