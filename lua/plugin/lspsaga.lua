local config = function()
	require("lspsaga").setup({
		lightbulb = {
			enable = false,
		},
		outline = {
			keys = {
				toggle_or_jump = "<CR>",
				quit = { "q", "<ESC>" },
			},
		},
		beacon = {
			enable = false,
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
			function()
				require("telescope.builtin").lsp_references()
			end,
			desc = "goto references",
		},
		{
			"gd",
			"<cmd>Lspsaga goto_definition<CR>",
			desc = "goto definitions",
		},
		{
			"gp",
			"<cmd>Lspsaga peek_definition<CR>",
			desc = "peek definitions",
		},
		{
			"D",
			function()
				vim.diagnostic.open_float()
			end,
		},
		{
			"<space>la",
			"<cmd>Lspsaga code_action<CR>",
			desc = "code action",
		},
	},
}
