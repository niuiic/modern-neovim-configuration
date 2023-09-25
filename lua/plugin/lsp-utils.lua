local config = function()
	local core = require("core")

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
							return core.lua.list.includes(available_files, function(v)
								return vim.bo.filetype == v
							end)
						end,
					},
					{ map = { "VolarFilePath", "LSPFilePath" } },
					{ map = { "VolarOrganizeImports", "LSPOrganizeImports" } },
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
}

return {
	config = config,
	keys = keys,
}
