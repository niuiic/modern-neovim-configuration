local dap = require("dap")
local dap_utils = require("dap-utils")

dap.adapters.dart = {
	type = "executable",
	command = "dart",
	args = { "debug_adapter" },
}
dap.adapters.flutter = {
	type = "executable",
	command = "flutter",
	args = { "debug_adapter" },
}

dap_utils.setup({
	dart = function(run)
		run({
			{
				type = "dart",
				request = "launch",
				name = "Launch dart",
				dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart",
				flutterSdkPath = "/opt/flutter/bin/flutter",
				program = vim.api.nvim_buf_get_name(0),
				cwd = "${workspaceFolder}",
			},
			{
				type = "flutter",
				request = "launch",
				name = "Launch flutter",
				dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart",
				flutterSdkPath = "/opt/flutter/bin/flutter",
				program = "${workspaceFolder}/lib/main.dart",
				cwd = "${workspaceFolder}",
			},
		})
	end,
})
