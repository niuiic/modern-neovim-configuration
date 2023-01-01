local crates = require("crates")

crates.setup({})

require("which-key").register({
	p = {
		name = "package",
		t = {
			function()
				crates.toggle()
			end,
			"toggle showing crate version",
		},
		u = {
			function()
				crates.upgrade_crate()
			end,
			"update crate",
		},
		U = {
			function()
				crates.upgrade_all_crates()
			end,
			"update all crates",
		},
		i = {
			function()
				crates.show_popup()
			end,
			"show crate info",
		},
		f = {
			function()
				crates.show_features_popup()
			end,
			"show crate features",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
