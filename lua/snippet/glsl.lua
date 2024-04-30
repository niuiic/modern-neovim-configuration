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
	s("2", {
		t({
			"vec2(",
		}),
		i(1),
		t({
			",",
		}),
		i(2),
		t({
			")",
		}),
	}),
	s("3", {
		t({
			"vec3(",
		}),
		i(1),
		t({
			",",
		}),
		i(2),
		t({
			",",
		}),
		i(3),
		t({
			")",
		}),
	}),
	s("4", {
		t({
			"vec4(",
		}),
		i(1),
		t({
			",",
		}),
		i(2),
		t({
			",",
		}),
		i(3),
		t({
			",",
		}),
		i(4),
		t({
			")",
		}),
	}),
}

return M
