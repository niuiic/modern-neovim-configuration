local config = function()
	require("symbols-outline").setup({
		width = 30,
		keymaps = {
			toggle_preview = "p",
			fold_all = "H",
			unfold_all = "L",
		},
		symbols = {
			File = { hl = "@text.uri" },
			Module = { hl = "@namespace" },
			Namespace = { hl = "@namespace" },
			Package = { hl = "@namespace" },
			Class = { hl = "@type" },
			Method = { hl = "@method" },
			Property = { hl = "@method" },
			Field = { hl = "@field" },
			Constructor = { hl = "@constructor" },
			Enum = { hl = "@type" },
			Interface = { hl = "@type" },
			Function = { hl = "@function" },
			Variable = { hl = "@constant" },
			Constant = { hl = "@constant" },
			String = { hl = "@string" },
			Number = { hl = "@number" },
			Boolean = { hl = "@boolean" },
			Array = { hl = "@constant" },
			Object = { hl = "@type" },
			Key = { hl = "@type" },
			Null = { hl = "@type" },
			EnumMember = { hl = "@field" },
			Struct = { hl = "@type" },
			Event = { hl = "@type" },
			Operator = { hl = "@operator" },
			TypeParameter = { hl = "@parameter" },
		},
	})
end

return {
	config = config,
	keys = {
		{
			"<space>m",
			function()
				if vim.bo.filetype == "markdown" or vim.bo.filetype == "Outline" then
					vim.cmd("SymbolsOutline")
				end
			end,
			desc = "toggle tag bar",
		},
	},
	ft = "markdown",
}
