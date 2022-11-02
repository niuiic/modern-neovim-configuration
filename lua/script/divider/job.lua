local M = {}

local plenary = require("plenary")

M.search = function(pattern, file)
	if not file then
		file = vim.api.nvim_buf_get_name(0)
	end

	local results = {}

	plenary.job
		:new({
			command = "rg",
			args = { "-e " .. pattern, file, "--vimgrep" },
			on_exit = function(res)
				results = res:result()
			end,
		})
		:sync()

	return results
end

return M
