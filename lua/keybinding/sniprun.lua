local utils = require("utils")

utils.fn.mapRegister({
	r = {
		name = "run code snip",
		r = {
			"<cmd>SnipRun<CR>",
			"run",
		},
		i = {
			"<cmd>SnipInfo<CR>",
			"info",
		},
		s = {
			"<cmd>SnipReset<CR>",
			"reset",
		},
		c = {
			"<cmd>SnipReplMemoryClean<CR>",
			"clean repl memory",
		},
		q = {
			"<cmd>SnipClose<CR>",
			"close",
		},
		t = {
			"<cmd>SnipTerminate<CR>",
			"terminate",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

utils.fn.mapRegister({
	r = {
		name = "run code snip",
		r = {
			function()
				require("sniprun").run("v")
			end,
			"run",
		},
	},
}, {
	mode = "v",
	prefix = "<localleader>",
})
