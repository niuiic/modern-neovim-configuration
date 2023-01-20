local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

local M = {
	s("svg", {
		t({ [[<svg style="border:1px solid black;">]], "\t" }),
		i(1),
		t({ "", "</svg>" }),
	}),
	s("circle", {
		t({ [[<circle r="]] }),
		i(1),
		t({ [["/>]] }),
	}),
	s("rect", {
		t({ [[<rect height="]] }),
		i(1),
		t({ [[" width="]] }),
		i(2),
		t({ [["/>]] }),
	}),
	s("ellipse", {
		t({ [[<ellipse rx="]] }),
		i(1),
		t({ [[" ry="]] }),
		i(2),
		t({ [["/>]] }),
	}),
	s("line", {
		t({ [[<line x1="]] }),
		i(1),
		t({ [[" y1="]] }),
		i(2),
		t({ [[" x2="]] }),
		i(3),
		t({ [[" y2="]] }),
		i(4),
		t({ [["/>]] }),
	}),
	s("polyline", {
		t({ [[<polyline points="]] }),
		i(1),
		t({ [["/>]] }),
	}),
	s("polygon", {
		t({ [[<polygon points="]] }),
		i(1),
		t({ [["/>]] }),
	}),
	s("path", {
		t({ [[<path d="]] }),
		i(1),
		t({ [["/>]] }),
	}),
}

local properties = {
	"style",
	"stroke",
}

for _, value in ipairs(properties) do
	table.insert(
		M,
		s(value, {
			t({ value .. [[="]] }),
			i(1),
			t({ [["/>]] }),
		})
	)
end

return M
