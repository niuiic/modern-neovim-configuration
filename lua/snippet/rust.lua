local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {
	s("unsafe", {
		t({ "unsafe {", "\t" }),
		i(1),
		t({ "", "}" }),
	}),
	s("ct", {
		t({ "/** ", "" }),
		i(1),
		t({ "", "*/" }),
	}),
	s("ctil", {
		t({ [[/* ]] }),
		i(1),
		t({ [[ */]] }),
	}),
	s("pppppp", {
		t({ "println!(" }),
		i(1),
		t({ ")" }),
	}),
}

return M
