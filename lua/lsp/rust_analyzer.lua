-- check more commands here
-- https://github.com/rust-lang/rust-analyzer/blob/master/editors/code/package.json
-- https://github.com/rust-lang/rust-analyzer/blob/master/docs/dev/lsp-extensions.md

local core = require("core")

local function organize_imports()
	local diagnostic_list = vim.diagnostic.get()
	local bufnr = vim.api.nvim_get_current_buf()
	local diagnostic = core.lua.list.find(diagnostic_list, function(diagnostic)
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

local M = {
	root_dir = core.file.root_path,
	settings = {
		["rust-analyzer"] = { diagnostics = { experimental = { enable = true } } },
	},
	commands = {
		RustAnalyzerRename = {
			function()
				vim.lsp.buf.rename(nil, {
					name = "rust_analyzer",
				})
			end,
			description = "Rename",
		},
		RustAnalyzerOrganizeImports = {
			organize_imports,
			description = "Organize imports",
		},
	},
}

return M
