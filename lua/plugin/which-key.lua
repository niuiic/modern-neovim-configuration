return {
	config = function()
		local which_key = require("which-key")

		which_key.setup({
			show_help = false,
			show_keys = false,
		})

		which_key.register({
			t = {
				name = "trouble",
			},
			d = {
				name = "debug",
			},
			g = {
				name = "git signs",
			},
			c = {
				name = "git conflict",
			},
			s = {
				name = "tasks",
			},
			w = {
				name = "window",
			},
			a = {
				name = "annotations",
			},
			o = {
				name = "fuzzy search",
				c = {
					name = "command",
				},
				g = {
					name = "global",
				},
			},
			b = {
				name = "buffer line",
			},
		}, {
			mode = "n",
			prefix = "<localleader>",
		})

		which_key.register({
			s = {
				name = "session",
			},
			l = {
				name = "sql cmd",
			},
			t = {
				name = "test",
			},
			c = {
				name = "color picker",
			},
			p = {
				name = "package",
			},
			d = {
				name = "diff view",
			},
			r = {
				name = "replace in project",
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})

		which_key.register({
			l = {
				name = "sql cmd",
			},
			r = {
				name = "replace in project",
			},
		}, {
			mode = "v",
			prefix = "<leader>",
		})
	end,
}
