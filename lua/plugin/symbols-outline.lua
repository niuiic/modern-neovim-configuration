local utils = require("utils")

utils.fn.require("symbols-outline").setup({
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

utils.fn.require("which-key").register({
	m = {
		function()
			if vim.bo.filetype == "markdown" or vim.bo.filetype == "Outline" then
				vim.api.nvim_command("SymbolsOutline")
			end
		end,
		"toggle tag bar",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
