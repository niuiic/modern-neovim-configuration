local dap = require("dap")
local dap_utils = require("dap-utils")
local core = require("core")

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
				dartSdkPath = core.file.file_or_dir_exists("/opt/bin/dart") and "/opt/bin/dart" or "/usr/bin/dart",
				flutterSdkPath = core.file.file_or_dir_exists("/opt/bin/flutter") and "/opt/bin/flutter",
				program = vim.api.nvim_buf_get_name(0),
				cwd = "${workspaceFolder}",
			},
			{
				type = "flutter",
				request = "launch",
				name = "Launch flutter",
				dartSdkPath = core.file.file_or_dir_exists("/opt/bin/dart") and "/opt/bin/dart" or "/usr/bin/dart",
				flutterSdkPath = core.file.file_or_dir_exists("/opt/bin/flutter") and "/opt/bin/flutter",
				program = "${workspaceFolder}/lib/main.dart",
				cwd = "${workspaceFolder}",
				toolArgs = { "-d", "chrome" },
			},
		})
	end,
})
