local config = function()
	vim.g.rustaceanvim = {
		tools = {
			hover_actions = {
				replace_builtin_hover = false,
			},
		},
		server = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			handlers = { ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }) },
			default_settings = {
				["rust-analyzer"] = { diagnostics = { experimental = { enable = true } } },
			},
		},
	}

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
			name = "rust-analyzer",
		})
	end

	local extra_operations = {
		["expand macros"] = function()
			vim.cmd.RustLsp("expandMacro")
		end,
		["rebuild proc macros"] = function()
			vim.cmd.RustLsp("rebuildProcMacros")
		end,
		["explain error"] = function()
			vim.cmd.RustLsp({ "explainError", "current" })
		end,
		["view hir"] = function()
			vim.cmd.RustLsp({ "view", "mir" })
		end,
		["view mir"] = function()
			vim.cmd.RustLsp({ "view", "mir" })
		end,
	}
	local choices = vim.tbl_keys(extra_operations)

	local extra = function()
		vim.ui.select(choices, {
			prompt = "Select Operation",
		}, function(choice)
			if not choice then
				return
			end

			extra_operations[choice]()
		end)
	end

	vim.api.nvim_create_user_command("RustAnalyzerRename", rename, {})
	vim.api.nvim_create_user_command("RustAnalyzerOrganizeImports", organize_imports, {})
	vim.api.nvim_create_user_command("RustAnalyzerExtra", extra, {})
end

return {
	config = config,
}
