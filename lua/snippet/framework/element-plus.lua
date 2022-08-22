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

local suffix = "el"
-- register snippets with suffix
local ss = function(trigger, snippet)
	return s(trigger .. "-" .. suffix, snippet)
end

local M = {
	-- elements
	ss(
		"col",
		fmt(
			[[
<el-col :span="{}">
  {} 
</el-col>
]],
			{ i(1), i(2) }
		)
	),
	ss(
		"row",
		fmt(
			[[
	<el-row
	  type="flex"
	  align="{}"
	  justify="{}"
	>
	  {}
	</el-row>
	]],
			{ i(1, "middle"), i(2, "space-evenly"), i(3) }
		)
	),
	ss(
		"icon",
		fmt(
			[[
<el-icon :size="{}">
  {} 
</el-icon>
]],
			{ i(1), i(2) }
		)
	),
	ss("input", fmt([[<el-input v-model="{}" placeholder="{}" />]], { i(1, "input"), i(2, "please input here") })),
	ss(
		"table",
		fmt(
			[[
<el-table :data="{}">
  {} 
</el-table>
]],
			{ i(1, "data"), i(2) }
		)
	),
	ss("table-column", fmt([[<el-table-column prop="{}" label="{}" />]], { i(1, "data.name"), i(2, "label") })),
	ss(
		"button",
		fmt(
			[[
<el-button type="{}" :icon="{}" >
  {}
</el-button>]],
			{ i(1, "primary"), i(2, "icon"), i(3, "Click Me") }
		)
	),
	ss(
		"image",
		fmt(
			[[<el-image style="width: {}; height: {}" :src="{}" fit="{}" />]],
			{ i(1, "100px"), i(2, "100px"), i(3, "require('pathToImg')"), i(4, "fill") }
		)
	),

	-- properties
	ss("type", { t({ 'type="' }), i(1, "flex"), t({ '"' }) }),
	ss("gutter", { t({ ':gutter="' }), i(1), t({ '"' }) }),
	ss("justify", { t({ ':justify="' }), i(1), t({ '"' }) }),
	ss("align", { t({ ':align="' }), i(1), t({ '"' }) }),
	ss("tag", { t({ ':tag="' }), i(1), t({ '"' }) }),
	ss("span", { t({ ':span="' }), i(1), t({ '"' }) }),
	ss("offset", { t({ ':offset="' }), i(1), t({ '"' }) }),
	ss("push", { t({ ':push="' }), i(1), t({ '"' }) }),
	ss("pull", { t({ ':pull="' }), i(1), t({ '"' }) }),
	ss("xs", { t({ ':xs="' }), i(1), t({ '"' }) }),
	ss("sm", { t({ ':sm="' }), i(1), t({ '"' }) }),
	ss("md", { t({ ':md="' }), i(1), t({ '"' }) }),
	ss("lg", { t({ ':lg="' }), i(1), t({ '"' }) }),
	ss("xl", { t({ ':xl="' }), i(1), t({ '"' }) }),
}

return M
