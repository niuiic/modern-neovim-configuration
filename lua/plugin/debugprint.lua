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
		},
		{
			"<C-b>",
			function()
				return require("debugprint").debugprint({ variable = true })
			end,
			desc = "debug print",
			expr = true,
			mode = "v",
		},
		{
			"<space>op",
			function()
				require("telescope.builtin").grep_string({
					search = "DEBUGPRINT",
					cwd = require("core").file.root_path(),
				})
			end,
			desc = "search debug print",
		},
	},
}
