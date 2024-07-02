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
				toggle_or_jump = "<CR>",
				quit = { "q", "<ESC>" },
			},
			win_width = 40,
		},
		beacon = {
			enable = false,
		},
		finder = {
			keys = {
				toggle_or_open = "<CR>",
				quit = { "q", "<ESC>" },
			},
		},
		callhierarchy = {
			keys = {
				toggle_or_open = "<CR>",
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
			"gf",
			"<cmd>Lspsaga finder ref<CR>",
			desc = "goto references",
		},
		{
			"gi",
			"<cmd>Lspsaga finder imp<CR>",
			desc = "goto implements",
		},
		{
			"gc",
			"<cmd>Lspsaga incoming_calls<CR>",
			desc = "goto incoming calls",
		},
		{
			"gC",
			"<cmd>Lspsaga outgoing_calls<CR>",
			desc = "goto outgoing calls",
		},
		{
			"gd",
			function()
				require("telescope.builtin").lsp_definitions()
			end,
			desc = "goto definitions",
		},
		{
			"J",
			vim.lsp.buf.hover,
			desc = "lsp hover",
		},
		{
			"<space>la",
			"<cmd>Lspsaga code_action<CR>",
			desc = "code action",
		},
	},
}
