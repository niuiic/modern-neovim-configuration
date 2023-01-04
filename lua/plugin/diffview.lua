local keys = {
	{ "<leader>ds", "<cmd>DiffviewOpen ", desc = "diff open specifically" },
	{ "<leader>do", "<cmd>DiffviewOpen<CR>", desc = "view uncommitted change" },
	{
		"<leader>dh",
		function()
			local file_path = vim.api.nvim_buf_get_name(0)
			vim.cmd("DiffviewFileHistory " .. file_path)
		end,
		desc = "view git history of current file",
	},
	{ "<leader>dH", "<cmd>DiffviewFileHistory<CR>", desc = "view git history of current project" },
	{ "<leader>dq", "<cmd>DiffviewClose<CR>", desc = "close diff windows" },
	{ "<leader>dr", "<cmd>DiffviewRefresh<CR>", desc = "refresh" },
}

return {
	config = function()
		require("diffview").setup({})
	end,
	keys = keys,
	dependencies = "nvim-lua/plenary.nvim",
}
