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
	s("pppppp", {
		t({ [[print(vim.inspect(]] }),
		i(1),
		t({ [[))]] }),
	}),
	s("tasks", {
		t({
			[[local core = require("core")]],
			"",
			[[local overseer = require("overseer")]],
			"",
			[[local scriptPath = core.file.root_path() .. "/.nvim/task/task.sh"]],
			"",
			[[overseer.register_template({]],
			[[	name = "template",]],
			[[	builder = function()]],
			[[		return {]],
			[[			cmd = { scriptPath },]],
			[[			args = { "template" },]],
			[[			components = { "on_exit_set_status", "on_output_quickfix", "on_complete_notify" },]],
			[[		}]],
			[[	end,]],
			[[})]],
		}),
	}),
	s("task", {
		t({
			[[overseer.register_template({]],
			[[	name = "]],
		}),
		i(1, "name"),
		t({
			[[",]],
			[[	builder = function()]],
			[[		return {]],
			[[			cmd = { scriptPath },]],
			[[			args = { "]],
		}),
		i(2, "args"),
		t({
			[[" },]],
			[[			components = { "on_exit_set_status", "on_output_quickfix", "on_complete_notify" },]],
			[[		}]],
			[[	end,]],
			[[})]],
		}),
	}),
}

return M
