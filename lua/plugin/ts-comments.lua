return {
	keys = {
		{
			"<C-a>",
			"<cmd>normal gcc<cr>",
			mode = { "n", "x" },
		},
	},
	config = function()
		require("ts-comments").setup({
			lang = {
				typescript = { "// %s", "/* %s */", "/** %s */" },
				javascript = { "// %s", "/* %s */", "/** %s */" },
				mermaid = { "%% %s" },
			},
		})
	end,
}
