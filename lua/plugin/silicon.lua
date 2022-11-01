local utils = require("utils")

utils.fn.require("silicon").setup({})

utils.fn.whichKeyMap({
	s = {
		function()
			require("silicon").visualise_api({ to_clip = true })
		end,
		"code shot",
	},
}, {
	mode = "v",
	prefix = "<leader>",
})
