return {
	config = function()
		require("ts-comments").setup({
			lang = {
				typescript = { "// %s", "/* %s */", "/** %s */" },
				javascript = { "// %s", "/* %s */", "/** %s */" },
			},
		})
	end,
	keys = {
		{ "<C-a>", "<cmd>normal gcc<cr>", mode = "x" },
		{ "<C-a>", "<cmd>normal gcc<cr>" },
	},
}
