local core = require("core")
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
