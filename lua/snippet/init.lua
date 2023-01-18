local utils = require("utils")
local luasnip = require("luasnip")

local lang_list = {
	"go",
	"lua",
	"vue",
	"markdown",
	"javascript",
	"typescript",
	"python",
	"scss",
	"glsl",
	"rust",
	"html",
	"svg",
}

local common_snippets = {
	"todo",
	"divider",
}

-- load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- register custom snippets
for _, value in pairs(lang_list) do
	local snippets = require("snippet/" .. value)

	-- merge common snippets
	for _, val in pairs(common_snippets) do
		local common_snippet = require("snippet/common/" .. val)
		snippets = utils.fn.merge_list(common_snippet, snippets)
	end

	luasnip.add_snippets(value, snippets, {
		key = value,
	})
end

require("luasnip.loaders.from_lua").lazy_load({ include = lang_list })
