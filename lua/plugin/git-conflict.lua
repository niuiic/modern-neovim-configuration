local utils = require("utils")

utils.fn.require("git-conflict").setup({
	default_mappings = false, -- disable buffer local mapping created by this plugin
	disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
	highlights = { -- They must have background color, otherwise the default color will be used
		incoming = "DiffText",
		current = "DiffAdd",
	},
})

-- keymap
utils.fn.whichKeyMap({
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
