local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local M = {
	s("ignore-line", {
		t({ "// @ts-expect-error" }),
	}),
	s("ignore-file", {
		t({ "// @ts-nocheck" }),
	}),
}

local common = require("snippet/common/node/js-ts")
M = vim.list_extend(common, M)

return M
