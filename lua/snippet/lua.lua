local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {
	s("echo", {
		t({ [[print(]] }),
		i(1),
		t({ [[)]] }),
	}),
	s("task", {
		t({
			[[require("overseer").register_template({]],
			[[name = "",]],
			[[builder = function()]],
			[[return {]],
			[[name = "",]],
			[[cmd = {},]],
			[[args = {},]],
			[[components = { "default" },]],
			[[}]],
			[[end,]],
			[[})]],
		}),
	}),
}

return M
