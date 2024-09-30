local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {
	s("d1", {
		t({ "% " }),
		i(1),
		t({ " %" }),
	}),
	s("d2", {
		t({ "%% " }),
		i(1),
		t({ " %%" }),
	}),
	s("d3", {
		t({ "%%% " }),
		i(1),
		t({ " %%%" }),
	}),
}

return M
