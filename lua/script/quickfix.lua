local core = require("niuiic-core")
local plenary = require("plenary")

local root_dir = core.file.root_path()
local qf_history_path = root_dir .. "/.nvim/quickfix"

local function load_qf(overwrite)
	if overwrite ~= true and #vim.fn.getqflist() ~= 0 then
		return
	end
	if core.file.file_or_dir_exists(qf_history_path) then
		local qf_history_content = {}
		local file = io.open(qf_history_path, "r")
		if file ~= nil then
			for line in file:lines() do
				table.insert(qf_history_content, line)
			end
			io.close(file)
		end
		vim.fn.setqflist({}, "r", {
			lines = qf_history_content,
		})
	end
end

-- vim.cmd with return value
local cmd = function(cmd)
	local res = vim.api.nvim_exec(cmd, true)
	return vim.split(res, "\n")
end

-- get buffer id by buffer name
local get_buffer_id = function(buf_name)
	local res = cmd([[buffers]])
	for _, value in ipairs(res) do
		local buffer_id_str = string.match(value, "(%d+)[%s%p%w]+" .. buf_name)
		if buffer_id_str ~= nil then
			return tonumber(buffer_id_str)
		end
	end
end

local function write_qf()
	if #vim.fn.getqflist() ~= 0 then
		if core.file.file_or_dir_exists(root_dir .. "/.nvim") ~= true then
			plenary.job
				:new({
					command = "mkdir",
					args = { root_dir .. "/.nvim" },
				})
				:sync()
		end
		local qf_buf_id = get_buffer_id("Quickfix List")
		local qf_content = vim.api.nvim_buf_get_lines(qf_buf_id, 0, -1, false)
		if core.file.file_or_dir_exists(qf_history_path) == true then
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

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
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
