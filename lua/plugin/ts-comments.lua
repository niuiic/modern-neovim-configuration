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
		{
			"<C-a>",
			function()
				local pos = vim.api.nvim_win_get_cursor(0)
				vim.notify(vim.inspect(pos))
				vim.cmd("normal gcc")
				vim.api.nvim_win_set_cursor(0, pos)
			end,
			mode = { "n", "x" },
		},
	},
}
