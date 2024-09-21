local config = function()
	require("lspsaga").setup({
		symbol_in_winbar = {
			enable = false,
		},
		lightbulb = {
			enable = false,
		},
		outline = {
			keys = {
				toggle_or_jump = "<cr>",
				quit = { "q", "<ESC>" },
			},
			win_width = 40,
		},
		beacon = {
			enable = false,
		},
		finder = {
			keys = {
				toggle_or_open = "<cr>",
				quit = { "q", "<ESC>" },
			},
		},
		callhierarchy = {
			keys = {
				toggle_or_open = "<cr>",
				quit = { "q", "<ESC>" },
			},
		},
		code_action = {
			extend_gitsigns = false,
			keys = {
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
			"J",
			vim.lsp.buf.hover,
			desc = "lsp hover",
		},
		{
			"D",
			function()
				vim.diagnostic.open_float({
					source = true,
					border = "rounded",
				})
			end,
		},
		{
			"<space>la",
			"<cmd>Lspsaga code_action<cr>",
			desc = "code action",
		},
	},
}
