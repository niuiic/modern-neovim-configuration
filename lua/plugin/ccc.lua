local config = function()
	local ccc = require("ccc")
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
end

local keys = {
	{ "<leader>co", "<cmd>CccPick<CR>", desc = "open color picker" },
	{ "<leader>cc", "<cmd>CccConvert<CR>", desc = "convert color value" },
	{ "<leader>ct", "<cmd>CccHighlighterToggle<CR>", desc = "toggle color highlighter" },
	{ "<leader>cr", "<cmd>DiffviewRefresh<CR>", desc = "refresh" },
}

return {
	config = config,
	keys = keys,
	lazy = false,
}
