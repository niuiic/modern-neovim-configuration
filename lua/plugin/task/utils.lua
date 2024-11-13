local M = {}

function M.run_in_term(commands)
	local on_term_opened = require("terminal.static").config.on_term_opened

	require("terminal").open(nil, nil, function(bufnr, pid, channel)
		on_term_opened(bufnr, pid, channel)

		local enter = vim.api.nvim_replace_termcodes("<cr>", true, true, true)
		vim.defer_fn(function()
			for _, command in ipairs(commands) do
				vim.api.nvim_chan_send(channel, command .. enter)
			end
		end, 100)
	end)
end

return M
