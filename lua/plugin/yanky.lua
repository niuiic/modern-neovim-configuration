local utils = require("utils")

local mapping = require("yanky.telescope.mapping")

require("yanky").setup({
	ring = {
		history_length = 10,
		storage = "shada",
		sync_with_numbered_registers = true,
	},
	picker = {
		select = {
			action = nil,
		},
		telescope = {
			mappings = {
				default = mapping.put("p"),
				n = nil,
				i = {
					["<C-a>"] = mapping.put("p"),
					["<C-i>"] = mapping.put("P"),
					["<C-x>"] = mapping.delete(),
				},
			},
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

require("telescope").load_extension("yank_history")

-- keymap
vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", { silent = true })
vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", { silent = true })
vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)", { silent = true })
vim.keymap.set("x", "P", "<Plug>(YankyPutBefore)", { silent = true })
vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", { silent = true })
