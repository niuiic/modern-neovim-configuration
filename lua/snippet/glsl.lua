local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {
	s("2", {
		t({
			"vec2(",
		}),
		i(1),
		t({
			")",
		}),
	}),
	s("3", {
		t({
			"vec3(",
		}),
		i(1),
		t({
			")",
		}),
	}),
	s("4", {
		t({
			"vec4(",
		}),
		i(1),
		t({
			")",
		}),
	}),
	s("gl_PointSize", {
		t({ "gl_PointSize" }),
	}),
	s("projectionMatrix", {
		t({ "projectionMatrix" }),
	}),
	s("modelViewMatrix", {
		t({ "modelViewMatrix" }),
	}),
}

return M
