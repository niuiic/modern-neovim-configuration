local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {
	s("todo", {
		t({ "TODO: " }),
		i(1),
	}),
	s("fix", {
		t({ "FIXME: " }),
		i(1),
	}),
	s("hack", {
		t({ "HACK: " }),
		i(1),
	}),
	s("checkbox", {
		t({ "☐ " }),
		i(1),
	}),
}

return M
