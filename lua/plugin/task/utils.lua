local M = {
	_terms = {},
}

function M.run_in_term(commands)
	local bufs = vim.iter(vim.api.nvim_list_wins())
		:map(function(winnr)
			return vim.api.nvim_win_get_buf(winnr)
		end)
		:filter(function(bufnr)
			return M._terms[bufnr] and vim.api.nvim_get_option_value("filetype", { buf = bufnr }) == "terminal"
		end)
		:totable()

	if #bufs > 0 then
		local choice = vim.fn.confirm("Reuse existing terminal?", "&Yes\n&No", 1)
		if choice == 1 then
			local bufnr = bufs[1]
			local channel = M._terms[bufnr].channel

			local enter = vim.api.nvim_replace_termcodes("<cr>", true, true, true)
			vim.defer_fn(function()
				for _, command in ipairs(commands) do
					vim.api.nvim_chan_send(channel, command .. enter)
				end
			end, 300)

			return
		end
	end

	local cur_winnr
	local choice = vim.fn.confirm("Run in another window?", "&Yes\n&No", 1)
	if choice == 1 then
		cur_winnr = vim.api.nvim_get_current_win()
		vim.cmd("20sp")
	end

	local on_term_opened = require("terminal.static").config.on_term_opened

	require("terminal").open(nil, nil, function(bufnr, pid, channel)
		M._terms[bufnr] = { pid = pid, channel = channel }
		on_term_opened(bufnr, pid, channel)

		local enter = vim.api.nvim_replace_termcodes("<cr>", true, true, true)
		vim.defer_fn(function()
			for _, command in ipairs(commands) do
				vim.api.nvim_chan_send(channel, command .. enter)
			end
		end, 300)

		if cur_winnr then
			vim.api.nvim_set_current_win(cur_winnr)
			require("omega").to_normal_mode()
		end
	end)
end

return M
