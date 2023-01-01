return {
	ft = "sql",
	keys = {
		{ "<leader>lr", "<cmd>SqlsExecuteQuery<CR>", desc = "exec current line" },
		{ "<leader>ld", "<cmd>SqlsSwitchDatabase<CR>", desc = "show databases" },
		{ "<leader>ls", "<cmd>SqlsShowSchemas<CR>", desc = "show schemas" },
		{ "<leader>lc", "<cmd>SqlsSwitchConnection<CR>", desc = "show connections" },
		{ "<leader>lr", "<Plug>(sqls-execute-query)", desc = "exec current ", mode = "v" },
	},
}
