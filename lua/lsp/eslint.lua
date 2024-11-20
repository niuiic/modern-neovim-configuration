local function fix_all()
	local diagnostic_list = vim.diagnostic.get()
	local diagnostic = vim.iter(diagnostic_list):find(function(diagnostic)
		return diagnostic.source == "eslint"
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
			return action.title == "Fix all auto-fixable problems"
		end,
	})
	vim.api.nvim_win_set_cursor(0, cur_pos)
end

local function is_enabled()
	if not (#vim.lsp.get_clients({
		name = "eslint",
	}) > 0) then
		return false
	end

	if vim.bo.filetype == "vue" then
		local node = vim.treesitter.get_node()
		while node do
			if
				string.find(node:sexpr(), "(script_element", 1, true) == 1
				or string.find(node:sexpr(), "(template_element", 1, true) == 1
			then
				return true
			end

			node = node:parent()
		end

		return false
	end

	return true
end

require("lsp-commands").register_command("fix all", {
	name = "eslint",
	run = fix_all,
	is_enabled = is_enabled,
})

return {
	root_dir = function()
		return vim.fs.root(0, ".git") or vim.fn.getcwd()
	end,
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		packageManager = "pnpm",
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "location",
		},
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
	},
	handlers = {
		["eslint/noLibrary"] = function()
			return {}
		end,
	},
}
