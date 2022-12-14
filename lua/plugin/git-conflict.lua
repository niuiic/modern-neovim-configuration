local utils = require("utils")

utils.fn.require("git-conflict").setup({
	default_mappings = false,
})

-- keymap
utils.fn.map({
	c = {
		name = "git conflict",
		c = {
			"<cmd>GitConflictChooseOurs<CR>",
			"select current changes",
		},
		i = {
			"<cmd>GitConflictChooseTheirs<CR>",
			"select incoming changes",
		},
		b = {
			"<cmd>GitConflictChooseBoth<CR>",
			"select both changes",
		},
		n = {
			"<cmd>GitConflictChooseNone<CR>",
			"select none changes",
		},
		j = {
			"<cmd>GitConflictNextConflict<CR>",
			"move to the next conflict",
		},
		k = {
			"<cmd>GitConflictPrevConflict<CR>",
			"move to the previous conflict",
		},
		l = {
			"<cmd>GitConflictListQf<CR>",
			"get all conflict to quickfix",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
