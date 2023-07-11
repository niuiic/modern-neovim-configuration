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
			local target_dir = root_path .. "/target/debug/"
			if core.file.file_or_dir_exists(target_dir) then
				local executable = {}
				for path, path_type in vim.fs.dir(target_dir) do
					if path_type == "file" then
						local perm = vim.fn.getfperm(target_dir .. path)
						if string.match(perm, "x", 3) then
							table.insert(executable, path)
						end
					end
				end
				if #executable == 1 then
					return target_dir .. executable[1]
				else
					local target
					vim.ui.select(executable, { prompt = "Select executable" }, function(choice)
						target = choice
					end)
					if not target then
						return target_dir .. executable[1]
					end
					return target_dir .. target
				end
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
