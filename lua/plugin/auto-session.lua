local utils = require("utils")

utils.fn.require("auto-session").setup({
	auto_session_enabled = false,
	auto_session_create_enabled = false,
	auto_session_root_dir = utils.fn.root_pattern() .. "/.nvim/session/",
})

-- keymap
utils.fn.whichKeyMap({
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
