require("lsp-commands").register_command({
	name = "lua_ls/rename vars",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "lua_ls",
		})
	end,
	is_enabled = function()
		return #vim.lsp.get_clients({
			name = "lua_ls",
		}) > 0
	end,
})

return {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			completion = { autoRequire = false },
		},
	},
}
