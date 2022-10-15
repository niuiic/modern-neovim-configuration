local utils = require("utils")
local plenary = utils.fn.require("plenary")

local search = function(pattern, file)
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

local ns_id = vim.api.nvim_create_namespace("divider")

vim.api.nvim_set_hl(0, "Divider", { fg = "#00ffff" })
vim.api.nvim_set_hl(0, "DividerChild", { fg = "#00ff00" })

local function divide(pattern, highlight)
	local results = search(pattern)
	if #results == 0 then
		return
	end
	local matched_lines = {}
	for _, value in ipairs(results) do
		local matched_line_str = string.match(value, "(%d+):%d+")
		if matched_line_str then
			table.insert(matched_lines, tonumber(matched_line_str))
		end
	end

	for _, line in ipairs(matched_lines) do
		vim.api.nvim_buf_add_highlight(0, ns_id, highlight, line - 1, 0, -1)
	end
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
		divide([[%%=+ [\s\S]+ =+%%]], "Divider")
		divide([[%%-+ [\s\S]+ -+%%]], "DividerChild")
	end,
})
