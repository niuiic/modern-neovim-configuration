local core = require("core")
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

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
	s("abstract", {
		t("abstract"),
	}),
}

local common = require("snippet/common/node/js-ts")
M = core.lua.list.merge(common, M)

return M
