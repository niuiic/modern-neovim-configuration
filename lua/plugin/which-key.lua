return {
	config = function()
		local which_key = require("which-key")

		which_key.setup({
			show_help = false,
			show_keys = false,
		})

		which_key.register({
			d = {
				name = "debug",
			},
			t = {
				name = "test",
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
			l = {
				name = "lsp",
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
				G = {
					name = "git",
				},
			},
			b = {
				name = "buffer line",
			},
			m = {
				name = "mark",
			},
			r = {
				name = "macro",
			},
		}, {
			mode = "n",
			prefix = "<localleader>",
		})

		which_key.register({
			s = {
				name = "session",
			},
			q = {
				name = "sql cmd",
			},
			t = {
				name = "trouble",
			},
			c = {
				name = "color picker",
			},
			p = {
				name = "package",
				r = {
					name = "rust",
				},
				n = {
					name = "node",
				},
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
			r = {
				name = "replace in project",
			},
		}, {
			mode = "v",
			prefix = "<leader>",
		})

		which_key.register({
			s = {
				name = "tasks",
			},
			g = {
				name = "git signs",
			},
		}, {
			mode = "v",
			prefix = "<localleader>",
		})
	end,
}
