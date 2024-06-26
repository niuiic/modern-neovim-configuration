return {
	config = function()
		require("flutter-tools").setup({
			lsp = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},
			dev_log = {
				enabled = false,
			},
			closing_tags = {
				prefix = "--> ",
			},
		})

		vim.api.nvim_create_user_command("DartlsRename", function()
			vim.lsp.buf.rename(nil, {
				name = "dartls",
			})
		end, {})
	end,
	keys = {
		{
			"<leader>f",
			function()
				require("telescope").extensions.flutter.commands()
			end,
			desc = "flutter commands",
		},
	},
	ft = "dart",
}
