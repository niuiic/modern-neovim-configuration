local dap = require("dap")

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
}

dap.configurations.javascriptreact = {
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.typescriptreact = {
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.vue = {
	{
		name = "Launch Chrome",
		request = "launch",
		type = "chrome",
		url = "http://localhost:8080",
		runtimeArgs = {
			"--auto-open-devtools-for-tabs",
		},
		runtimeExecutable = "/usr/bin/google-chrome-beta",
		userDataDir = false,
		webRoot = "${workspaceFolder}/xxx",
	},
	{
		name = "attach chrome",
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}/xxx",
	},
}

-- Start chrome in debug mode using `google-chrome-stable --remote-debugging-port=9222`
-- To fix `va_getDriverName() failed` error, try following solutions.
-- LIBVA_DRIVER_NAME=radeonsi chromium
-- Try setting the Preferred Ozone platform (chrome://flags/#ozone-platform-hint) to Auto.
