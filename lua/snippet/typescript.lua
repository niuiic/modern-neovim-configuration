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
	s("ignore-line", {
		t({ "// @ts-expect-error" }),
	}),
	s("ignore-file", {
		t({ "// @ts-nocheck" }),
	}),
	-- inner type tools
	s(
		"parameters",
		fmt(
			[[
            Parameters<{}>
]],
			{ i(1, "Function") }
		)
	),
	s(
		"returnType",
		fmt(
			[[
            ReturnType<{}>
]],
			{ i(1, "Function") }
		)
	),
	s(
		"constructorParameters",
		fmt(
			[[
            ConstructorParameters<{}>
]],
			{ i(1, "Constructor") }
		)
	),
	s(
		"instanceType",
		fmt(
			[[
            InstanceType<{}>
]],
			{ i(1, "Instance") }
		)
	),
	s(
		"thisParameterType",
		fmt(
			[[
            ThisParameterType<{}>
]],
			{ i(1, "Function") }
		)
	),
	s(
		"omitThisParameter",
		fmt(
			[[
            OmitThisParameter<{}>
]],
			{ i(1, "Function") }
		)
	),
	s(
		"partial",
		fmt(
			[[
            Partial<{}>
]],
			{ i(1, "Object") }
		)
	),
	s(
		"required",
		fmt(
			[[
            Required<{}>
]],
			{ i(1, "Object") }
		)
	),
	s(
		"readonly",
		fmt(
			[[
            Readonly<{}>
]],
			{ i(1, "Object") }
		)
	),
	s(
		"pick",
		fmt(
			[[
            Pick<{}, {}>
]],
			{ i(1, "Object"), i(2, "Key") }
		)
	),
	s(
		"record",
		fmt(
			[[
            Record<{}, {}>
]],
			{ i(1, "Key"), i(2, "Value") }
		)
	),
	s(
		"exclude",
		fmt(
			[[
            Exclude<{}, {}>
]],
			{ i(1, "Type"), i(2, "Exclude") }
		)
	),
	s(
		"extract",
		fmt(
			[[
            Exclude<{}, {}>
]],
			{ i(1, "Type"), i(2, "Extract") }
		)
	),
	s(
		"omit",
		fmt(
			[[
            Omit<{}, {}>
]],
			{ i(1, "Type"), i(2, "Omit") }
		)
	),
	s(
		"awaited",
		fmt(
			[[
            Awaited<{}>
]],
			{ i(1, "Promise") }
		)
	),
	s(
		"nonNullable",
		fmt(
			[[
            NonNullable<{}>
]],
			{ i(1, "Type") }
		)
	),
	s(
		"uppercase",
		fmt(
			[[
            Uppercase<{}>
]],
			{ i(1, "String") }
		)
	),
	s(
		"lowercase",
		fmt(
			[[
            Lowercase<{}>
]],
			{ i(1, "String") }
		)
	),
	s(
		"capitalize",
		fmt(
			[[
            Capitalize<{}>
]],
			{ i(1, "String") }
		)
	),
	s(
		"uncapitalize",
		fmt(
			[[
            Uncapitalize<{}>
]],
			{ i(1, "String") }
		)
	),
}

local common = utils.fn.require("snippet/common/node/js-ts")
M = utils.fn.merge_table(common, M)

return M
