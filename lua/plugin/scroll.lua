return {
	keys = {
		{
			"<C-d>",
			function()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local target_line = vim.api.nvim_win_get_cursor(0)[1] + screen_h / 2
				local step = screen_h / 2 / 50
				if step < 1 then
					step = 1
				end

				require("scroll").scroll(target_line, function(current_line)
					return {
						next_line = current_line + step,
						delay = 10,
					}
				end)
			end,
			desc = "scroll down",
		},
		{
			"<C-u>",
			function()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local target_line = vim.api.nvim_win_get_cursor(0)[1] - screen_h / 2
				local step = screen_h / 2 / 50
				if step < 1 then
					step = 1
				end

				require("scroll").scroll(target_line, function(current_line)
					return {
						next_line = current_line - step,
						delay = 10,
					}
				end)
			end,
			desc = "scroll down",
		},
	},
}
