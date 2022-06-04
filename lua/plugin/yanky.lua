local utils = require("utils")

-- config
utils.fn.require("yanky").setup({
	ring = {
		history_length = 10,
		storage = "shada",
		sync_with_numbered_registers = true,
	},
	picker = {
		select = {
			action = nil,
		},
	},
	system_clipboard = {
		sync_with_ring = false,
	},
	highlight = {
		on_put = true,
		on_yank = true,
		timer = 500,
	},
	preserve_cursor_position = {
		enabled = true,
	},
})

utils.fn.require("telescope").load_extension("yank_history")

-- keymap
utils.fn.map("n", "p", "<Plug>(YankyPutAfter)", utils.var.opt)
utils.fn.map("n", "P", "<Plug>(YankyPutBefore)", utils.var.opt)
utils.fn.map("x", "p", "<Plug>(YankyPutAfter)", utils.var.opt)
utils.fn.map("x", "P", "<Plug>(YankyPutBefore)", utils.var.opt)
