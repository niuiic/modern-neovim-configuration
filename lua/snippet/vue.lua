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
<!-- # script -->
<script setup lang="ts">
// ## 组件配置
  {}  
</script>

<!-- # template -->
<template>
  {}    
</template>

<!-- # style -->
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
	s("pppppp", {
		t({ "console.log(" }),
		i(1),
		t({ ")" }),
	}),
	s("ignore-stylelint", {
		t({ "stylelint-disable-next-line" }),
	}),
	s("ct", {
		t({ [[/**]], " * " }),
		i(1),
		t({ "", [[ */]] }),
	}),
	s("ctil", {
		t({ [[/** ]] }),
		i(1),
		t({ [[ */]] }),
	}),
}

return M
