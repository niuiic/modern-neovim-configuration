local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {
	s("ignore-stylelint", {
		t({ "stylelint-disable-next-line" }),
	}),
	s("conic-gradient", {
		t({ "conic-gradient(" }),
		i(1),
		t({ ", " }),
		i(2),
		t({ ")" }),
	}),
}

return M
