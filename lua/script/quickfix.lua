local utils = require("utils")
local plenary = utils.fn.require("plenary")

local root_dir = utils.fn.root_pattern()
local qf_history_path = root_dir .. "/.nvim/quickfix"

local function load_qf(overwrite)
	if overwrite ~= true and #vim.fn.getqflist() ~= 0 then
		return
	end
	if utils.fn.file_exists(qf_history_path) then
		local qf_history_content = {}
		local file = io.open(qf_history_path, "r")
		if file ~= nil then
			for line in file:lines() do
				table.insert(qf_history_content, line)
			end
			io.close(file)
		end
		utils.fn.call(vim.fn.setqflist, {}, "r", {
			lines = qf_history_content,
		})
	end
end

local function write_qf()
	if #vim.fn.getqflist() ~= 0 then
		if utils.fn.file_exists(root_dir .. "/.nvim") ~= true then
			plenary.job
				:new({
					command = "mkdir",
					args = { root_dir .. "/.nvim" },
				})
				:sync()
		end
		local qf_buf_id = utils.fn.get_buffer_id("Quickfix List")
		local qf_content = vim.api.nvim_buf_get_lines(qf_buf_id, 0, -1, false)
		if utils.fn.file_exists(qf_history_path) == true then
			os.remove(qf_history_path)
		end
		local file = io.open(qf_history_path, "a")
		if file ~= nil then
			for _, line in ipairs(qf_content) do
				file:write(line .. "\n")
			end
			io.close(file)
		end
	end
end

vim.api.nvim_create_user_command("LoadQf", function()
	load_qf(true)
end, {})

vim.api.nvim_create_user_command("WriteQf", function()
	write_qf()
end, {})

vim.api.nvim_create_user_command("SaveAndSaveQf", function()
	if vim.bo.filetype == "qf" then
		vim.cmd([[write! ]] .. qf_history_path)
	else
		vim.cmd([[w!]])
	end
end, {})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "qf" then
			vim.cmd([[set modifiable]])
		end
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		load_qf()
	end,
})
