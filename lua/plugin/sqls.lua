return {
	ft = "sql",
	keys = {
		{ "<leader>qr", "<cmd>SqlsExecuteQuery<CR>", desc = "exec current line" },
		{ "<leader>qd", "<cmd>SqlsSwitchDatabase<CR>", desc = "show databases" },
		{ "<leader>qs", "<cmd>SqlsShowSchemas<CR>", desc = "show schemas" },
		{ "<leader>qc", "<cmd>SqlsSwitchConnection<CR>", desc = "show connections" },
		{ "<leader>qr", "<Plug>(sqls-execute-query)", desc = "exec current ", mode = "v" },
	},
}
