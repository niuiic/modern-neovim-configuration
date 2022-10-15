local utils = require("utils")
local luasnip = utils.fn.require("luasnip")

local lang_list = {
	"go",
	"lua",
	"vue",
	"markdown",
	"javascript",
	"typescript",
	"python",
}

local common_snippets = {
	"todo",
	"divider",
}

-- load friendly-snippets
utils.fn.require("luasnip.loaders.from_vscode").lazy_load()

-- register custom snippets
for _, value in pairs(lang_list) do
	local snippets = utils.fn.require("snippet/" .. value)

	-- merge common snippets
	for _, val in pairs(common_snippets) do
		local common_snippet = utils.fn.require("snippet/common/" .. val)
		snippets = utils.fn.merge_table(common_snippet, snippets)
	end

	luasnip.add_snippets(value, snippets, {
		key = value,
	})
end

utils.fn.require("luasnip.loaders.from_lua").lazy_load({ include = lang_list })
