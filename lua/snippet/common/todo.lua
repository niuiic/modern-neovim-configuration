local utils = require("utils")
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
	s("todo", {
		t({ [[TODO: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
	s("verify", {
		t({ [[VERIFY: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
	s("fake", {
		t({ [[FAKE: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
	s("mark", {
		t({ [[MARK: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
	s("hack", {
		t({ [[HACK: ]] }),
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
	s("temp", {
		t({ [[TEMP: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
	s("question", {
		t({ [[Q: ]] }),
		i(1),
		t({ [[ (niuiic)]] }),
	}),
}

return M
