return {
	config = function()
		require("multiple-session").setup({
			default_arg_num = 2,
		})
	end,
	keys = {
		{ "<leader>ss", "<cmd>SaveSession<CR>", desc = "save session" },
		{ "<leader>sr", "<cmd>RestoreSession<CR>", desc = "restore session" },
		{ "<leader>sa", "<cmd>EnableAutoSaveSession<CR>", desc = "enable auto save session" },
		{ "<leader>sA", "<cmd>DisableAutoSaveSession<CR>", desc = "disable auto save session" },
		{ "<leader>sd", "<cmd>DeleteSession<CR>", desc = "delete session" },
	},
	lazy = false,
	dependencies = { "niuiic/niuiic-core.nvim" },
}
