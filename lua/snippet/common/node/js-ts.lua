local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {
	s("echo", {
		t({ "console.log(" }),
		i(1),
		t({ ")" }),
	}),
	s("tc", {
		t({ "try {", "\t" }),
		i(1),
		t({ "", "} catch (e" }),
		i(2),
		t({ ") {", "\t" }),
		i(3),
		t({ "", "}" }),
	}),
	s("ignore-eslint", {
		t({ "eslint-disable-next-line" }),
	}),
	s("ct", {
		t({ [[/**]], " * " }),
		i(1),
		t({ "", [[ */]] }),
	}),
	s("ctil", {
		t({ [[/** ]] }),
		i(1),
		t({ [[ */]] }),
	}),
}

return M
