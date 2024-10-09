local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local M = {
	s("biome", {
		t({
			[[{]],
			[[  "formatter": {]],
			[[    "indentStyle": "space",]],
			[[    "lineWidth": 120]],
			[[  },]],
			[[  "organizeImports": {]],
			[[    "enabled": true]],
			[[  },]],
			[[  "javascript": {]],
			[[    "formatter": {]],
			[[      "quoteStyle": "single",]],
			[[      "semicolons": "asNeeded",]],
			[[      "trailingCommas": "none"]],
			[[    }]],
			[[  }]],
			[[}]],
		}),
	}),
}

return M
