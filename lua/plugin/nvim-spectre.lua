local utils = require("utils")

local spectre = utils.fn.require("spectre")

spectre.setup({
	live_update = true,
	open_cmd = "new",
	mapping = {
		["enter_file"] = {
			map = "<cr>",
			cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
			desc = "goto current file",
		},
		["run_current_replace"] = {
			map = "r",
			cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
			desc = "replace current line",
		},
		["run_replace"] = {
			map = "R",
			cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
			desc = "replace all",
		},
	},
})

utils.fn.map({
	r = {
		name = "replace in project",
		w = {
			function()
				spectre.open_visual({ select_word = true })
			end,
			"replace current word",
		},
		c = {
			function()
				spectre.open_file_search()
			end,
			"replace in current file",
		},
		r = {
			function()
				spectre.open()
			end,
			"replace",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})

utils.fn.map({
	r = {
		function()
			spectre.open_visual()
		end,
		"replace in project",
	},
}, {
	mode = "v",
	prefix = "<leader>",
})
