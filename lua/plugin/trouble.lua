local utils = require("utils")

utils.fn.require("trouble").setup({
	action_keys = {
		close = "q",
		cancel = "<esc>",
		refresh = "r",
		jump = { "<cr>" },
		open_split = { "<c-h>" },
		open_vsplit = { "<c-v>" },
		open_tab = { "<c-t>" },
		jump_close = { "o" },
		toggle_mode = "m",
		toggle_preview = "t",
		hover = "K",
		preview = "p",
		close_folds = { "zm" },
		open_folds = { "zr" },
		toggle_fold = { "z" },
		previous = "k",
		next = "j",
	},
	auto_close = true,
	auto_open = true,
	auto_preview = true,
})

utils.fn.whichKeyMap({
	t = {
		name = "trouble",
		d = {
			"<cmd>TroubleToggle workspace_diagnostics<CR>",
			"open diagnostics",
		},
		l = {
			"<cmd>TroubleToggle loclist<CR>",
			"open loclist",
		},
		f = {
			"<cmd>TroubleToggle lsp_references<CR>",
			"open lsp references list",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
