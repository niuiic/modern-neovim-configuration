return function(type)
	local node = vim.treesitter.get_node()
	if not node then
		return
	end

	local text = vim.treesitter.get_node_text(node, vim.api.nvim_get_current_buf())

	local max
	---@diagnostic disable-next-line: param-type-mismatch
	for id in string.gmatch(text, "n([%d]+)") do
		if not max or tonumber(id) > tonumber(max) then
			max = id
		end
	end
	if not max then
		return
	end

	if type == "last" then
		vim.snippet.expand(string.format("n%s --> ${1}", tonumber(max)))
	elseif type == "next" then
		vim.snippet.expand(string.format("n%s[${1}]", tonumber(max) + 1))
	end
end
