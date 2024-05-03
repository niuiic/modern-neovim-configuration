local config = function()
	require("lsp-utils").setup({
		lsps = {
			["typescript-tools"] = {
				commands_map = {
					{ map = { "TSToolsRenameFile", "LSPRenameFile" } },
					{ map = { "TsRename", "LSPRename" } },
					{ map = { "TsOrganizeImports", "LSPOrganizeImports" } },
					{ map = { "TSToolsFixAll", "LSPFixAll" } },
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
			rust_analyzer = {
				commands_map = {
					{ map = { "RustAnalyzerRename", "LSPRename" } },
					{ map = { "RustAnalyzerOrganizeImports", "LSPOrganizeImports" } },
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
		},
	})
end

local use_toggle_inlay_hint = function()
	local enable = false
	return function()
		if enable then
			vim.lsp.inlay_hint(0, false)
			enable = false
		else
			vim.lsp.inlay_hint(0, true)
			enable = true
		end
	end
end

local toggle_inlay_hint = use_toggle_inlay_hint()

local keys = {
	{
		"<space>lf",
		"<cmd>LSPRenameFile<CR>",
		desc = "rename file",
	},
	{
		"<space>lp",
		"<cmd>LSPFilePath<CR>",
		desc = "copy path",
	},
	{
		"<space>lr",
		"<cmd>LSPRename<CR>",
		desc = "rename vars",
	},
	{
		"<space>li",
		"<cmd>LSPOrganizeImports<CR>",
		desc = "organize imports",
	},
	{
		"<space>lF",
		"<cmd>LSPFixAll<CR>",
		desc = "fix all",
	},
	{
		"<space>lR",
		"<cmd>LspRestart *<CR>",
		desc = "restart all lsp",
	},
	{
		"<space>ll",
		toggle_inlay_hint,
		desc = "toggle inlay hint",
	},
	{
		"<space>le",
		"<cmd>LSPExec<CR>",
		desc = "exec code",
		mode = { "n", "x" },
	},
}

return {
	config = config,
	keys = keys,
}
