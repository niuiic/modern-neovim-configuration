require("diffview").setup({})

-- keymap
vim.keymap.set("n", "<leader>ds", ":DiffviewOpen ", { silent = true })
require("which-key").register({
	d = {
		name = "diffview",
		s = {
			"diff open specifically",
		},
		o = {
			"<cmd>DiffviewOpen<CR>",
			"view uncommitted change",
		},
		h = {
			function()
				local file_path = vim.api.nvim_buf_get_name(0)
				vim.api.nvim_command("DiffviewFileHistory " .. file_path)
			end,
			"view git history of current file",
		},
		H = {
			"<cmd>DiffviewFileHistory<CR>",
			"view git history of current project",
		},
		q = {
			"<cmd>DiffviewClose<CR>",
			"close diff windows",
		},
		r = {
			"<cmd>DiffviewRefresh<CR>",
			"refresh",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
