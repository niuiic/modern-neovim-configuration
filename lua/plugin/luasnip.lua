local config = function()
	require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
end

local keys = {
	{
		"<A-j>",
		function()
			require("luasnip").expand_or_jump()
		end,
		mode = { "i", "s" },
	},
	{
		"<A-k>",
		function()
			require("luasnip").jump(-1)
		end,
		mode = { "i", "s" },
	},
}

return {
	config = config,
	keys = keys,
	lazy = false,
	build = "make install_jsregexp",
}
