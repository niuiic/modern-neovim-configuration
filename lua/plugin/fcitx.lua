local utils = require("utils")

utils.fn.require("fcitx")({
	enable = {
		insert = true,
		cmdline = false,
		cmdtext = true,
		select = true,
	},
	guess_initial_status = true,
})
