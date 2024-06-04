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
			q = {
				name = "quickfix",
			},
		}, {
			mode = "n",
			prefix = "<localleader>",
		})

		which_key.register({
			s = {
				name = "session",
			},
			e = {
				name = "remote",
			},
			d = {
				name = "diff view",
			},
			r = {
				name = "replace in project",
			},
			f = {
				name = "flutter",
			},
			l = {
				name = "divider",
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
			g = {
				name = "git signs",
			},
		}, {
			mode = "v",
			prefix = "<localleader>",
		})
	end,
}
