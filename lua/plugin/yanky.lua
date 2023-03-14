local config = function()
	local mapping = require("yanky.telescope.mapping")

	require("yanky").setup({
		ring = {
			history_length = 10,
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
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
				},
			},
		},
		system_clipboard = {
			sync_with_ring = false,
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
