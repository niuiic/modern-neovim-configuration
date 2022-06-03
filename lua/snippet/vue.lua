-- see examples on https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua
-- see document on https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
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

ls.add_snippets("vue", {
    s("ts", {
        t({ [[<script lang="ts">]], "\t" }),
        i(1),
        t({ "", "</script>" }),
    }),
    s("template", {
        t({ "<template>", "\t" }),
        i(1),
        t({ "", "</template>" }),
    }),
    s("scss", {
        t({ [[<style lang="scss" scoped>]], "\t" .. [[@import url("]] }),
        i(1),
        t({ [[")]], "</style>" }),
    }),
}, {
    key = "vue",
})

require("luasnip.loaders.from_lua").load({ include = { "vue" } })