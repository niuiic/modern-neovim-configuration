local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {
	s("echo", {
		t({ [[vim.notify(vim.inspect(]] }),
		i(1),
		t({ [[))]] }),
	}),
}

return M
