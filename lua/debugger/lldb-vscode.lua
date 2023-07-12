local core = require("niuiic-core")
local dap = require("dap")
local dap_utils = require("dap-utils")

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode",
	name = "lldb",
}

local common = function(run)
	run({
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
	})
end

dap_utils.setup({
	cpp = common,
	c = common,
})

dap_utils.setup({
	rust = function(run)
		local config = {
			name = "Launch",
			type = "lldb",
			request = "launch",
			program = nil,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},
		}
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
				config.program = target_dir .. executable[1]
				run(config)
			else
				vim.ui.select(executable, { prompt = "Select executable" }, function(choice)
					if not choice then
						return
					end
					config.program = target_dir .. choice
					run(config)
				end)
			end
		else
			vim.ui.input({ prompt = "Path to executable: ", default = root_path .. "/target/debug/" }, function(input)
				config.program = input
				run(config)
			end)
		end
	end,
})
