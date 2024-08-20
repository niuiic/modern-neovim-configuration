local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {
	s("todo", {
		t({ "[ ] (" }),
		i(1),
		t({ "): " }),
		i(2),
	}),
}

return M
