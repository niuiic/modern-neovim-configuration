local dap = require("dap")
local dap_utils = require("dap-utils")

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}

dap_utils.setup({
	rust = function(run)
		local config = {
			name = "Launch",
			type = "codelldb",
			request = "launch",
			program = nil,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		}
		vim.cmd("!cargo build")
		local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
		local target_dir = root_dir .. "/target/debug/"
		if require("omega").exist(target_dir) then
			local executable = {}
			for path, path_type in vim.fs.dir(target_dir) do
				if path_type == "file" then
					local perm = vim.fn.getfperm(target_dir .. path)
					if perm and string.match(perm, "x", 3) then
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
			vim.ui.input({ prompt = "Path to executable: ", default = root_dir .. "/target/debug/" }, function(input)
				config.program = input
				run(config)
			end)
		end
	end,
})
