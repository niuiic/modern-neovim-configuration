local dap = require("dap")
local dap_utils = require("dap-utils")

dap.adapters.dart = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("data") .. "/mason/packages/dart-debug-adapter/extension/out/dist/debug.js", "flutter" },
}

dap_utils.setup({
	dart = function(run)
		run({
			type = "dart",
			request = "launch",
			name = "Launch flutter",
			dartSdkPath = "/opt/dart-sdk/",
			flutterSdkPath = "/opt/flutter",
			program = "${workspaceFolder}/lib/main.dart",
			cwd = "${workspaceFolder}",
		})
	end,
})
