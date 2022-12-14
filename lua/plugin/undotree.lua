local utils = require("utils")
local undotree = utils.fn.require("undotree")
undotree.setup()

utils.fn.map({
	u = {
		function()
			undotree.toggle()
		end,
		"undotree",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
