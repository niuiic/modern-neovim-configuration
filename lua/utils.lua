local M = { fn = {}, var = {} }

-- find project root
local getPrevLevelPath = function(currentPath)
	local tmp = string.reverse(currentPath)
	local _, i = string.find(tmp, "/")
	return string.sub(currentPath, 1, string.len(currentPath) - i)
end

M.fn.root_pattern = function(pattern)
	pattern = pattern or "/.git"
	local path = vim.fn.getcwd(-1, -1)
	local pathBp = path
	while path ~= "" do
		local file, _ = io.open(path .. pattern)
		if file ~= nil then
			return path
		else
			path = getPrevLevelPath(path)
		end
	end
	return pathBp
end

-- load plugin config
M.fn.load_plugin_config = function(plugin, config_path)
	local status, config = pcall(require, config_path)
	if not status or config == nil then
		vim.notify("Error: failed to load config " .. config_path, vim.log.levels.ERROR)
		return {}
	end
	table.insert(config, 1, plugin)
	return config
end

M.fn.load_dev_plugin_config = function(plugin, config_path)
	if config_path == nil then
		return {
			dir = plugin,
			dev = true,
		}
	end
	local status, config = pcall(require, config_path)
	if not status or config == nil then
		vim.notify("Error: failed to load config " .. config_path, vim.log.levels.ERROR)
		return {}
	end
	config.dir = plugin
	config.dev = true
	return config
end

-- merge list
-- table2 will override table1
M.fn.merge_list = function(table1, table2)
	if table1 == nil then
		return table2
	end
	if table2 == nil then
		return table1
	end
	local res = {}
	for _, value in pairs(table2) do
		table.insert(res, value)
	end
	for _, value in pairs(table1) do
		local isInTable = false
		for _, val in pairs(table2) do
			if val == value then
				isInTable = true
				break
			end
		end
		if isInTable == false then
			table.insert(res, value)
		end
	end
	return res
end

-- merge object
-- table2 will override table1
M.fn.merge_object = function(table1, table2)
	if table1 == nil then
		return table2
	end
	if table2 == nil then
		return table1
	end
	local res = {}
	for key, value in pairs(table2) do
		res[key] = value
	end
	for key1, value in pairs(table1) do
		local isInTable = false
		for key2, _ in pairs(table2) do
			if key1 == key2 then
				isInTable = true
				break
			end
		end
		if isInTable == false then
			table[key1] = value
		end
	end
	return res
end

-- deep clone a table
M.fn.deep_clone = function(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == "table" then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[M.fn.deep_clone(orig_key)] = M.fn.deep_clone(orig_value)
		end
		setmetatable(copy, M.fn.deep_clone(getmetatable(orig)))
	else
		copy = orig
	end
	return copy
end

-- check if file exists
M.fn.file_or_dir_exists = function(path)
	local file = io.open(path, "r")
	if file ~= nil then
		io.close(file)
		return true
	else
		return false
	end
end

-- check if str is in the file
M.fn.match_str_in_file = function(path, str)
	if M.fn.file_or_dir_exists(path) then
		local file = io.open(path, "r")
		---@diagnostic disable-next-line: param-type-mismatch
		io.input(file)
		local content = io.read("*a")
		if string.match(content, str) then
			io.close(file)
			return true
		else
			io.close(file)
			return false
		end
	else
		return false
	end
end

-- wrapper of pcall
M.fn.call = function(func, ...)
	local success, err = pcall(func, ...)
	if success ~= true then
		error(err)
	end
end

-- vim.cmd with return value
M.fn.cmd = function(cmd)
	local res = vim.api.nvim_exec(cmd, true)
	return vim.split(res, "\n")
end

-- get buffer id by buffer name
M.fn.get_buffer_id = function(buf_name)
	local res = M.fn.cmd([[buffers]])
	for _, value in ipairs(res) do
		local buffer_id_str = string.match(value, "(%d+)[%s%p%w]+" .. buf_name)
		if buffer_id_str ~= nil then
			return tonumber(buffer_id_str)
		end
	end
end

-- get virtual selection
M.fn.get_visual_selection = function()
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")
	local n_lines = math.abs(s_end[2] - s_start[2]) + 1
	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
	lines[1] = string.sub(lines[1], s_start[3], -1)
	if n_lines == 1 then
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
	else
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
	end
	return table.concat(lines, "\n")
end

-- insert text
M.fn.insert_text = function(text)
	local pos = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()
	local new_line = line:sub(0, pos) .. text .. line:sub(pos + 1)
	vim.api.nvim_set_current_line(new_line)
end

M.fn.log = function(text)
	local file = io.open(M.fn.root_pattern() .. "/.nvim/log", "w")
	if file == nil then
		vim.notify("failed to write log", vim.log.levels.ERROR)
		return
	end
	io.output(file)
	io.write(text)
	io.close(file)
end

return M
