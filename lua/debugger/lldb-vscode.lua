local utils = require("utils")
local dap = utils.fn.require("dap")

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
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
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
			vim.api.nvim_command("!cargo build")
			local root_path = utils.fn.root_pattern()
			local project_name = string.match(root_path, "/([%w_]+)$")
			local target = root_path .. "/target/debug/" .. project_name
			if utils.fn.file_exists(target) then
				return target
			else
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}
