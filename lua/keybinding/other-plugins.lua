local utils = require("utils")

-- format
utils.fn.map("n", "<AC-l>", ":lua vim.lsp.buf.format()<CR>", utils.var.opt)

-- Comment.nvim
utils.fn.map("v", "<C-a>", "<Plug>(comment_toggle_linewise_visual)", utils.var.opt)
utils.fn.map("n", "<C-a>", "<Plug>(comment_toggle_current_linewise)", utils.var.opt)

-- undotree
utils.fn.mapRegister({
	u = {
		"<cmd>UndotreeToggle<CR>",
		"undotree",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

-- nvim-expand-expr
utils.fn.mapRegister({
	e = {
		function()
			require("expand_expr").expand()
		end,
		"expand and repeat expression to multiple lines",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

-- nvim-tree
utils.fn.mapRegister({
	p = {
		"<cmd>NvimTreeToggle<CR>",
		"toggle file tree",
	},
}, {
	mode = "n",
	prefix = "<leader>",
})

-- symbols-outline
utils.fn.mapRegister({
	m = {
		"<cmd>SymbolsOutline<CR>",
		"toggle tagbar",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

-- vim-startuptime
utils.fn.mapRegister({
	a = {
		"<cmd>StartupTime<CR>",
		"check startup time",
	},
}, {
	mode = "n",
	prefix = "<leader>",
})

-- lazygit
utils.fn.mapRegister({
	g = {
		"<cmd>LazyGit<CR>",
		"lazygit",
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
