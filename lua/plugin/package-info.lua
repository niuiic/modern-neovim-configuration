local package_info = require("package-info")

package_info.setup({})

require("which-key").register({
	p = {
		name = "package",
		t = {
			function()
				package_info.toggle()
			end,
			"toggle showing package version",
		},
		u = {
			function()
				package_info.update()
			end,
			"update package",
		},
		c = {
			function()
				package_info.change_version()
			end,
			"change package version",
		},
		d = {
			function()
				package_info.delete()
			end,
			"delete package",
		},
		i = {
			function()
				package_info.install()
			end,
			"install new package",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
