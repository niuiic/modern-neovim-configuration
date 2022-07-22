local utils = require("utils")

utils.fn.require("mark-radar").setup({
	set_default_mappings = true,
	highlight_group = "RadarMark",
	background_highlight = true,
	background_highlight_group = "RadarBackground",
})

-- use [' / ]' to jump to previous/next mark.
