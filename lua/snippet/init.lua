local luasnip = require("luasnip")

local lang_list = {
	"lua",
	"vue",
	"markdown",
	"javascript",
	"typescript",
	"scss",
	"glsl",
	"rust",
	"html",
	"svg",
	"typescriptreact",
	"javascriptreact",
	"python",
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

	luasnip.add_snippets(value, snippets, {
		key = value,
	})
end

-- register common snippets
local snippets = {}
for _, val in pairs(common_snippets) do
	local common_snippet = require("snippet/common/" .. val)
	snippets = vim.list_extend(common_snippet, snippets)
end
luasnip.add_snippets("all", snippets, {
	key = "all",
})

require("luasnip.loaders.from_lua").lazy_load({ include = lang_list })
