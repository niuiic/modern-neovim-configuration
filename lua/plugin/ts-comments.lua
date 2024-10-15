return {
	config = function()
		require("mini.comment").setup({
			mappings = {
				comment = "<C-a>",
				comment_line = "<C-a>",
				comment_visual = "<C-a>",
				textobject = "<C-a>",
			},
		})
		require("ts-comments").setup({
			lang = {
				typescript = { "// %s", "/* %s */", "/** %s */" },
				javascript = { "// %s", "/* %s */", "/** %s */" },
				mermaid = { "%% %s" },
			},
		})
	end,
	dependencies = { "echasnovski/mini.comment" },
}
