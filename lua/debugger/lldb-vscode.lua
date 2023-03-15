local core = require("niuiic-core")
local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode",
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			local root_path = core.file.root_path()
			local input_val
			vim.ui.input({ prompt = "Path to executable: ", default = root_path .. "/" }, function(input)
				input_val = input
			end)
			return input_val
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			vim.cmd("!cargo build")
			local root_path = core.file.root_path()
			local project_name = string.match(root_path, "/([%w_-]+)$")
			local target = root_path .. "/target/debug/" .. project_name
			if core.file.file_or_dir_exists(target) then
				return target
			else
				local input_val
				vim.ui.input(
					{ prompt = "Path to executable: ", default = root_path .. "/target/debug/" },
					function(input)
						input_val = input
					end
				)
				return input_val
			end
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}
