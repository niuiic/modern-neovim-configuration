local M = {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
		},
	},
	commands = {
		LuaLsRename = {
			function()
				vim.lsp.buf.rename(nil, {
					name = "lua_ls",
				})
			end,
			description = "Rename",
		},
	},
}

return M
