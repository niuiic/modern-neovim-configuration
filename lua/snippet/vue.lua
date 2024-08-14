local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

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
		t({ "<template ~" }),
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
<!-- ~ script -->
<script setup lang="ts">
// ~~ 组件配置
</script>

<!-- ~ template -->
<template>
  <div></div>
</template>

<!-- ~ style -->
<style lang="scss" scoped></style>
    ]],
			{}
		)
	),
	s("echo", {
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
