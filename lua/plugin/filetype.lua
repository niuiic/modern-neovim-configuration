local utils = require("utils")

utils.fn.require("filetype").setup({
	overrides = {
		extensions = {
			h = "c",
			hpp = "cpp",
			vert = "glsl",
			tesc = "glsl",
			tese = "glsl",
			geom = "glsl",
			frag = "glsl",
			comp = "glsl",
			rgen = "glsl",
			rint = "glsl",
			rahit = "glsl",
			rchit = "glsl",
			rmiss = "glsl",
			rcall = "glsl",
		},
	},
})
