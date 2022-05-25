local utils = require("utils")

utils.fn.mapRegister({
	s = {
		name = "session",
		s = {
			"<cmd>SaveSession<CR>",
			"save session",
		},
		r = {
			"<cmd>RestoreSession<CR>",
			"restore session",
		},
		d = {
			"<cmd>DeleteSession<CR>",
			"delete session",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
