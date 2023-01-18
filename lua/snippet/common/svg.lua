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

local prefix = "svg"
local ss = function(name, snippet)
	return s(prefix .. "-" .. name, snippet)
end

local M = {
	s("svg", {
		t({ [[<svg xmlns="http://www.w3.org/2000/svg">]], "\t" }),
		i(1),
		t({ "", "</svg>" }),
	}),
	ss("circle", {
		t({ [[<circle r="]] }),
		i(1),
		t({ [[">]], "\t" }),
		i(2),
		t({ "", "</circle>" }),
	}),
	ss("rect", {
		t({ [[<rect height="]] }),
		i(1),
		t({ [[" width="]] }),
		i(2),
		t({ [[">]], "\t" }),
		i(3),
		t({ "", "</rect>" }),
	}),
	ss("ellipse", {
		t({ [[<ellipse rx="]] }),
		i(1),
		t({ [[" ry="]] }),
		i(2),
		t({ [[">]], "\t" }),
		i(3),
		t({ "", "</ellipse>" }),
	}),
	ss("line", {
		t({ [[<line x1="]] }),
		i(1),
		t({ [[" y1="]] }),
		i(2),
		t({ [[" x2="]] }),
		i(3),
		t({ [[" y2="]] }),
		i(4),
		t({ [[">]], "\t" }),
		i(5),
		t({ "", "</line>" }),
	}),
	ss("polyline", {
		t({ [[<polyline points="]] }),
		i(1),
		t({ [[">]], "\t" }),
		i(2),
		t({ "", "</polyline>" }),
	}),
	ss("path", {
		t({ [[<path d="]] }),
		i(1),
		t({ [[">]], "\t" }),
		i(2),
		t({ "", "</path>" }),
	}),
}

return M
