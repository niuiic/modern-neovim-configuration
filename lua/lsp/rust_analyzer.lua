local function organize_imports()
	local diagnostic_list = vim.diagnostic.get()
	local bufnr = vim.api.nvim_get_current_buf()
	local diagnostic = vim.iter(diagnostic_list):find(function(diagnostic)
		if diagnostic.bufnr ~= bufnr then
			return false
		end
		local start = string.find(diagnostic.message, "cannot find")
		if start ~= nil then
			return true
		end
		start = string.find(diagnostic.message, "unused import")
		if start ~= nil then
			return true
		end
		start = string.find(diagnostic.message, "undeclared type")
		if start ~= nil then
			return true
		end
		return false
	end)
	if diagnostic == nil then
		return
	end
	local cur_pos = vim.api.nvim_win_get_cursor(0)
	vim.api.nvim_win_set_cursor(0, {
		diagnostic.lnum + 1,
		diagnostic.col,
	})
	vim.lsp.buf.code_action({
		apply = true,
		filter = function(action)
			return string.find(action.title, "Import ") ~= nil
				or string.find(action.title, "Remove") ~= nil
				or string.find(action.title, "remove") ~= nil
		end,
	})
	vim.api.nvim_win_set_cursor(0, cur_pos)
end

local rename = function()
	vim.lsp.buf.rename(nil, {
		name = "rust_analyzer",
	})
end

return {
	capabilities = { experimental = { enable = true } },
	commands = {
		RustAnalyzerRename = { rename, description = "Rename" },
		RustAnalyzerOrganizeImports = { organize_imports, description = "Organize imports" },
	},
}
