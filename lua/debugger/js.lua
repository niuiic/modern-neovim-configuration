local core = require("niuiic-core")

require("dap-vscode-js").setup({
	debugger_cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/js-debug-adapter" },
})

core.lua.list.each({ "pwa-node", "pwa-chrome" }, function(v)
	require("dap").adapters[v] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "node",
			args = {
				os.getenv("HOME")
					.. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
				"${port}",
			},
		},
	}
end)

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			name = "Launch project",
			type = "pwa-node",
			request = "launch",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "pnpm",
			runtimeArgs = {
				"debug",
			},
		},
		{
			name = "Launch cmd",
			type = "pwa-node",
			request = "launch",
			cwd = core.file.root_path(),
			runtimeExecutable = "pnpm",
			runtimeArgs = {
				"debug:cmd",
			},
		},
		{
			name = "Launch file",
			type = "pwa-node",
			request = "launch",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			name = "Attach",
			type = "pwa-node",
			request = "attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end

for _, language in ipairs({ "typescriptreact", "javascriptreact", "vue" }) do
	require("dap").configurations[language] = {
		{
			name = "Launch Chrome",
			type = "pwa-chrome",
			request = "launch",
			runtimeExecutable = "/usr/bin/google-chrome-stable",
			userDataDir = false,
			webRoot = "${workspaceFolder}",
		},
		{
			name = "attach chrome",
			type = "pwa-chrome",
			request = "attach",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
	}
end