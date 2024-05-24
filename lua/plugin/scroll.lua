return {
	keys = {
		{
			"<C-d>",
			function()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local target_lnum = vim.api.nvim_win_get_cursor(0)[1] + screen_h / 2
				local step = screen_h / 2 / 50
				step = step >= 1 and step or 1

				require("scroll").scroll(target_lnum, function(current_line, target_line)
					local fold_end = vim.fn.foldclosedend(current_line)

					if fold_end < 0 then
						return {
							next_line = current_line + step,
							delay = 10,
						}
					end

					local fold_start = vim.fn.foldclosed(current_line)

					return {
						next_line = fold_end + 1,
						delay = 10,
						target_line = target_line + fold_end - fold_start,
					}
				end)
			end,
			desc = "scroll down",
			mode = { "n", "x" },
		},
		{
			"<C-u>",
			function()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local target_lnum = vim.api.nvim_win_get_cursor(0)[1] - screen_h / 2
				local step = screen_h / 2 / 50
				if step < 1 then
					step = 1
				end

				require("scroll").scroll(target_lnum, function(current_line, target_line)
					local fold_end = vim.fn.foldclosedend(current_line)
					if fold_end > 0 then
						local fold_start = vim.fn.foldclosed(current_line)

						return {
							next_line = fold_start - 1,
							delay = 10,
							target_line = target_line - fold_end + fold_start,
						}
					end

					return {
						next_line = current_line - step,
						delay = 10,
					}
				end)
			end,
			desc = "scroll up",
			mode = { "n", "x" },
		},
	},
}
