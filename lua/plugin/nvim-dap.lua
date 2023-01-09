local config = function()
	local dapui = require("dapui")
	local dap = require("dap")

	dapui.setup()

	dap.listeners.after.event_initialized.dapui_config = function()
		dapui.open({})
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close({})
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close({})
	end

	require("nvim-dap-virtual-text").setup({})

	require("debugger")
end

local keys = {
	-- set breakpoint
	{
		"<space>dt",
		function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
		desc = "set conditional breakpoint",
	},
	{
		"<space>dl",
		function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end,
		desc = "set log point",
	},
	{
		"<A-t>",
		function()
			require("dap").toggle_breakpoint()
		end,
	},
	{
		"<space>de",
		function()
			require("dap").set_exception_breakpoints()
		end,
		desc = "set exception breakpoint",
	},
	-- action for breakpoints
	{
		"<space>dL",
		function()
			require("telescope").extensions.dap.list_breakpoints({})
		end,
		desc = "list all breakpoints",
	},
	{
		"<space>dc",
		function()
			require("dap").clear_breakpoints()
		end,
		desc = "clear all breakpoints",
	},
	{
		"gb",
		function()
			require("goto-breakpoints").next()
		end,
		desc = "go to next breakpoint",
	},
	{
		"gB",
		function()
			require("goto-breakpoints").prev()
		end,
		desc = "go to previous breakpoint",
	},
	-- panel
	{
		"<space>dr",
		function()
			require("dap").repl.open()
		end,
		desc = "open repl",
	},
	-- step
	{
		"<A-c>",
		function()
			require("dap").continue()
		end,
	},
	{
		"<A-n>",
		function()
			require("dap").step_over()
		end,
	},
	{
		"<A-b>",
		function()
			require("dap").step_back()
		end,
	},
	{
		"<A-i>",
		function()
			require("dap").step_into()
		end,
	},
	{
		"<A-o>",
		function()
			require("dap").step_out()
		end,
	},
	-- other
	{
		"<space>dq",
		function()
			require("dap").terminate()
			require("dapui").close({})
		end,
		desc = "quit debug",
	},
	{
		"<space>dC",
		function()
			require("telescope").extensions.dap.commands({})
		end,
		desc = "list all commands",
	},
}

return {
	config = config,
	keys = keys,
}
