require("lsp-commands").register_command({
	name = "lua_ls/rename vars",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "lua_ls",
		})
	end,
	is_enabled = function()
		return require("tools.lsp_valid")("lua_ls")
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
