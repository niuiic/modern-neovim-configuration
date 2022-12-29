local undotree = require("undotree")
undotree.setup()

require("which-key").register({
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
