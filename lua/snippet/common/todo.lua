local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

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
