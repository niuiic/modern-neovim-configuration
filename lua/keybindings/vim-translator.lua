utils = require("utils")

utils.fn.mapRegister({
	t = {
		name = "translate",
		p = {
			"<Plug>TranslateW",
			"popup",
		},
		e = {
			"<Plug>Translate",
			"echo",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

utils.fn.mapRegister({
	t = {
		name = "translate",
		p = {
			"<Plug>TranslateWV",
			"popup",
		},
		e = {
			"<Plug>TranslateV",
			"echo",
		},
	},
}, {
	mode = "v",
	prefix = "<localleader>",
})
