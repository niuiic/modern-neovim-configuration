return {
	config = function()
		local vue = {
			left = "console.log(`",
			right = "')",
			mid_var = "`, ",
			right_var = ")",
		}
		require("debugprint").setup({
			keymaps = {},
			commands = {},
			move_to_debugline = true,
			filetypes = {
				vue = vue,
				javascript = vue,
				typescript = vue,
				javascriptreact = vue,
				typescriptreact = vue,
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<C-b>",
			function()
				return require("debugprint").debugprint({ variable = true })
			end,
			desc = "debug print",
			expr = true,
			mode = { "n", "x" },
		},
		{
			"<space>op",
			function()
				require("telescope.builtin").grep_string({
					search = "DEBUGPRINT",
					cwd = require("omega").root_pattern(".git") or vim.fn.getcwd(),
				})
			end,
			desc = "search debug print",
		},
	},
}
