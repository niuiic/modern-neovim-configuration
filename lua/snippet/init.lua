local utils = require("utils")
local luasnip = utils.fn.require("luasnip")

local langList = {
	"go",
	"lua",
	"vue",
	"scss",
	"markdown",
	"javascript",
	"typescript",
	"python",
}

-- load friendly-snippets
utils.fn.require("luasnip.loaders.from_vscode").lazy_load()

-- register custom snippets
for _, value in pairs(langList) do
	local snippet = utils.fn.require("snippet/" .. value)
	luasnip.add_snippets(value, snippet, {
		key = value,
	})
end

utils.fn.require("luasnip.loaders.from_lua").lazy_load({ include = langList })
