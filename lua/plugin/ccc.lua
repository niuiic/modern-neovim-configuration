local utils = require("utils")

local ccc = utils.fn.require("ccc")
local mapping = ccc.mapping
ccc.setup({
	highlighter = {
		auto_enable = true,
	},
	mappings = {
		["d"] = mapping.decrease5,
		["u"] = mapping.increase5,
		["D"] = mapping.decrease10,
		["U"] = mapping.increase10,
	},
})

utils.fn.whichKeyMap({
	c = {
		name = "ccc",
		o = { "<cmd>CccPick<CR>", "open color picker" },
		c = {
			"<cmd>CccConvert<CR>",
			"convert color value",
		},
		t = {
			"<cmd>CccHighlighterToggle<CR>",
			"toggle color highlighter",
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