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
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local M = {
	s("setup", {
		t({ [[<script setup lang="ts">]], "\t" }),
		i(1),
		t({ "", "</script>" }),
	}),
	s("template", {
		t({ "<template>", "\t" }),
		i(1),
		t({ "", "</template>" }),
	}),
	s("scss", {
		t({ [[<style lang="scss">]], "\t" }),
		i(1),
		t({ "", "</style>" }),
	}),
	s("style-scoped", {
		t({ "<style scoped>" }),
		i(1),
		t({ "", "</style>" }),
	}),
	s("style-module", {
		t({ "<style module>" }),
		i(1),
		t({ "", "</style>" }),
	}),
	s("print", {
		t({ "console.log(" }),
		i(1),
		t({ ")" }),
	}),
	s("border", {
		t({ "border: solid black 2px;" }),
	}),
}

local elementPlus = utils.fn.require("snippet/framework/element-plus")
M = utils.fn.mergeTable(elementPlus, M)

return M
