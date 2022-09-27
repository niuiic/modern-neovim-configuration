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
	s("slot", {
		t({ "<template #" }),
		i(1, "name"),
		t({ ">", "\t" }),
		i(2),
		t({ "", "</template>" }),
	}),
	s("scss", {
		t({ [[<style lang="scss" scoped>]], "\t" }),
		i(1),
		t({ "", "</style>" }),
	}),
	s("scss-no-scoped", {
		t({ [[<style lang="scss">]] }),
		i(1),
		t({ "", "</style>" }),
	}),
	s("style-module", {
		t({ "<style module>" }),
		i(1),
		t({ "", "</style>" }),
	}),
	s("border", {
		t({ "border: solid black 2px;" }),
	}),
	s(
		"new-file",
		fmt(
			[[
<script setup lang="ts">
  {}  
</script>

<template>
  {}    
</template>

<style lang="scss" scoped>
  {}   
</style>
    ]],
			{
				i(1),
				i(2),
				i(3),
			}
		)
	),
}

local elementPlus = utils.fn.require("snippet/framework/element-plus")
M = utils.fn.merge_table(elementPlus, M)
local common = utils.fn.require("snippet/common/js-ts")
M = utils.fn.merge_table(common, M)
local style = utils.fn.require("snippet/common/style")
M = utils.fn.merge_table(style, M)
local lint = utils.fn.require("snippet/common/lint")
M = utils.fn.merge_table(lint, M)
local todo = utils.fn.require("snippet/common/todo")
M = utils.fn.merge_table(todo, M)

return M
