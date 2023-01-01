local config = function()
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
end

local keys = {
	{ "p", "<Plug>(YankyPutAfter)" },
	{ "P", "<Plug>(YankyPutBefore)" },
	{ "p", "<Plug>(YankyPutAfter)", mode = "x" },
	{ "P", "<Plug>(YankyPutBefore)", mode = "x" },
}

return {
	config = config,
	keys = keys,
	lazy = false,
}
