local config = function()
	require("lsp-utils").setup({
		lsps = {
			vtsls = {
				commands_map = {
					{ map = { "VtsExec rename_file", "LSPRenameFile" } },
					{ map = { "VtslsRename", "LSPRename" } },
					{ map = { "VtslsOrganizeImports", "LSPOrganizeImports" } },
					{ map = { "VtsExec fix_all", "LSPFixAll" } },
				},
			},
			denols = {
				commands_map = {
					{ map = { "DenolsRename", "LSPRename" } },
				},
			},
			volar = {
				commands_map = {
					{ map = { "VolarFilePath", "LSPFilePath" } },
				},
			},
			lua_ls = {
				commands_map = {
					{ map = { "LuaLsRename", "LSPRename" } },
				},
			},
			["rust-analyzer"] = {
				commands_map = {
					{ map = { "RustAnalyzerRename", "LSPRename" } },
					{ map = { "RustAnalyzerOrganizeImports", "LSPOrganizeImports" } },
					{ map = { "RustAnalyzerExtra", "LSPExtra" } },
				},
			},
			eslint = {
				commands_map = {
					{ map = { "EslintFixAll", "LSPFixAll" } },
				},
			},
			bashls = {
				commands_map = {
					{ map = { "BashlsRename", "LSPRename" } },
				},
			},
			sqls = {
				commands_map = {
					{ map = { "SqlsExec", "LSPExec" } },
				},
			},
			stylelint_lsp = {
				commands_map = {
					{ map = { "StylelintFixAll", "LSPFixAll" } },
				},
			},
			pyright = {
				commands_map = {
					{ map = { "PyrightRename", "LSPRename" } },
				},
			},
		},
	})
end

local toggle_inlay_hint = function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end

local keys = {
	{
		"<space>lF",
		"<cmd>LSPRenameFile<cr>",
		desc = "rename file",
	},
	{
		"<space>lp",
		"<cmd>LSPFilePath<cr>",
		desc = "copy path",
	},
	{
		"<space>lr",
		"<cmd>LSPRename<cr>",
		desc = "rename vars",
	},
	{
		"<space>li",
		"<cmd>LSPOrganizeImports<cr>",
		desc = "organize imports",
	},
	{
		"<space>lf",
		"<cmd>LSPFixAll<cr>",
		desc = "fix all",
	},
	{
		"<space>lR",
		"<cmd>LspRestart *<cr>",
		desc = "restart all lsp",
	},
	{
		"<space>ll",
		toggle_inlay_hint,
		desc = "toggle inlay hint",
	},
	{
		"<space>le",
		"<cmd>LSPExec<cr>",
		desc = "exec code",
		mode = { "n", "x" },
	},
	{
		"<space>lE",
		"<cmd>LSPExtra<cr>",
		desc = "extra operations",
		mode = { "n", "x" },
	},
}

return {
	config = config,
	keys = keys,
}
