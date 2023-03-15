local M = { fn = {} }

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

return M
