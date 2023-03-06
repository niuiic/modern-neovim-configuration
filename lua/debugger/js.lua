local utils = require("utils")

require("dap-vscode-js").setup({
	debugger_path = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter",
})

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
			cwd = utils.fn.root_pattern(),
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
			request = "launch",
			type = "pwa-chrome",
			runtimeExecutable = "/usr/bin/google-chrome-stable",
			userDataDir = false,
			webRoot = "${workspaceFolder}/unknown",
		},
		{
			name = "attach chrome",
			type = "pwa-chrome",
			request = "attach",
			sourceMaps = true,
			port = 9222,
			webRoot = "${workspaceFolder}/unknown",
		},
	}
end
