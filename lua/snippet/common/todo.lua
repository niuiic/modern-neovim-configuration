local utils = require("utils")
local ls = utils.fn.require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = utils.fn.require("luasnip.util.events")
local ai = utils.fn.require("luasnip.nodes.absolute_indexer")
local fmt = utils.fn.require("luasnip.extras.fmt").fmt
local m = utils.fn.require("luasnip.extras").m
local lambda = utils.fn.require("luasnip.extras").l
local postfix = utils.fn.require("luasnip.extras.postfix").postfix

local M = {
	s("todo", {
		t({ [[TODO: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
	s("fakedata", {
		t({ [[FAKEDATA: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
	s("fixme", {
		t({ [[FIXME: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
	s("note", {
		t({ [[NOTE: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
	s("warn", {
		t({ [[WARN: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
	s("perf", {
		t({ [[PERF: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
}

return M
