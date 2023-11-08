local core = require("core")

local M = {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
				pathStrict = false,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = "Disable",
			},
			telemetry = {
				enable = false,
			},
			hint = {
				enable = true,
			},
		},
	},
	root_dir = core.file.root_path,
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
