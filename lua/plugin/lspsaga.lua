local config = function()
	require("lspsaga").setup({
		lightbulb = {
			sign_priority = 1,
		},
		outline = {
			keys = {
				expand_or_jump = "<CR>",
				quit = { "q", "<ESC>" },
			},
		},
		beacon = {
			enable = false,
		},
		finder = {
			keys = {
				jump_to = "<CR>",
				expand_or_jump = "<CR>",
				quit = { "q", "<ESC>" },
			},
		},
	})
end

return {
	event = "BufRead",
	config = config,
	keys = {
		{
			"<space>lo",
			"<cmd>Lspsaga outline<CR>",
			desc = "outline",
		},
		{
			"gj",
			function()
				vim.diagnostic.goto_next({ float = false })
			end,
			desc = "jump to next diagnostic",
		},
		{
			"gJ",
			function()
				vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, float = false })
			end,
			desc = "jump to next error",
		},
		{
			"gk",
			function()
				vim.diagnostic.goto_prev({ float = false })
			end,
			desc = "jump to previous diagnostic",
		},
		{
			"gK",
			function()
				vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, float = false })
			end,
			desc = "jump to previous error",
		},
		{
			"gf",
			"<cmd>Lspsaga lsp_finder<CR>",
			desc = "lsp finder",
		},
		{
			"gd",
			"<cmd>Lspsaga goto_definition<CR>",
			desc = "goto definitions",
		},
		{
			"D",
			function()
				vim.diagnostic.open_float()
			end,
		},
	},
}
