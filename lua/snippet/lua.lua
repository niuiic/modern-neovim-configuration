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
	s("root_dir", {
		t({
			[[vim.fs.root(0, ".git") or vim.fn.getcwd()]],
		}),
	}),
	s("omega", {
		t({
			[[require("omega").]],
		}),
	}),
}

return M
