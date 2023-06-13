return {
	config = function()
		require("mini.animate").setup({
			cursor = {
				timing = require("mini.animate").gen_timing.linear({ duration = 100, unit = "total" }),
			},
			open = { enable = false },
			close = { enable = false },
		})
	end,
}
