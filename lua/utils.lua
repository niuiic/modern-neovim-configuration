local M = { fn = {}, var = {} }

-- find project root
local getPrevLevelPath = function(currentPath)
	local tmp = string.reverse(currentPath)
	local _, i = string.find(tmp, "/")
	return string.sub(currentPath, 1, string.len(currentPath) - i)
end

M.fn.rootPattern = function(pattern)
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

-- set keymap
M.fn.map = vim.api.nvim_set_keymap
M.var.opt = { noremap = true, silent = true }
M.fn.whichKeyMap = require("which-key").register

-- load config
M.fn.loadConfig = function(configs)
	for _, value in pairs(configs) do
		local status, _ = pcall(require, value)
		if not status then
			print("Error: failed to load config " .. value)
		end
	end
end

-- `require` with error handling
M.fn.require = function(package_name)
	local status, package = pcall(require, package_name)
	if not status then
		print("Error: package " .. package_name .. " not found")
	end
	return package
end

-- merge table
-- if override is true, table2 will override table1 (default to false)
M.fn.mergeTable = function(table1, table2, override)
	override = override or false
	local res = {}
	for key, value in pairs(table1) do
		res[key] = value
	end
	for key, value in pairs(table2) do
		if res[key] == nil then
			res[key] = value
		else
			if override == true then
				res[key] = value
			end
		end
	end
	return res
end

return M
