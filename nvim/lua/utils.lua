utils = { fn = {} }

local getPrevLevelPath = function(currentPath)
	tmp = string.reverse(currentPath)
	_, i = string.find(tmp, "/")
	return string.sub(currentPath, 1, string.len(currentPath) - i)
end

utils.fn.getWorkspacePath = function()
	local path = vim.fn.getcwd(-1, -1)
	local pathBp = path
	while path ~= "" do
		local file, _ = io.open(path .. "/.root")
		if file ~= nil then
			return path
		else
			path = getPrevLevelPath(path)
		end
	end
	return pathBp
end

return utils
