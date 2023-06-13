local config = function()
	local lua = require("niuiic-core").lua

	require("lsp-utils").setup({
		lsps = {
			tsserver = {
				commands_map = {
					{ map = { "TsserverRenameFile", "LSPRenameFile" } },
					{ map = { "TsserverRename", "LSPRename" } },
					{ map = { "TsserverOrganizeImports", "LSPOrganizeImports" } },
				},
			},
			volar = {
				commands_map = {
					{
						map = { "VolarRename", "LSPRename" },
						enable = function()
							local available_files = {
								"typescript",
								"typescriptreact",
								"javascript",
								"javascriptreact",
								"vue",
							}
							return lua.list.includes(available_files, function(v)
								return vim.bo.filetype == v
							end)
						end,
					},
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
				},
			},
		},
	})
end

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
}

return {
	config = config,
	keys = keys,
}
