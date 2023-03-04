local config = function()
	local dapui = require("dapui")
	local dap = require("dap")

	dapui.setup()

	dap.listeners.after.event_initialized.dapui_config = function()
		dapui.open({})
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
	{
		"<A-p>",
		function()
			require("dap").pause()
		end,
	},
	{
		"<A-u>",
		function()
			require("dap").up()
		end,
	},
	{
		"<A-d>",
		function()
			require("dap").down()
		end,
	},
	{
		"<A-g>",
		function()
			require("dap").run_to_cursor()
		end,
	},
	-- other
	{
		"<space>dq",
		function()
			require("dap").terminate()
			require("dapui").close({})
			require("dap.repl").close({})
			require("nvim-dap-virtual-text/virtual_text").clear_virtual_text()
		end,
		desc = "quit debug",
	},
	{
		"<space>dr",
		function()
			require("dap").run_last()
		end,
		desc = "restart",
	},
	{
		"<space>dC",
		function()
			require("telescope").extensions.dap.commands({})
		end,
		desc = "list all commands",
	},
	{
		"M",
		function()
			require("dap.ui.widgets").hover()
		end,
		desc = "check variable value",
	},
	{
		"M",
		function()
			require("dap.ui.widgets").hover()
		end,
		desc = "check variable value",
		mode = "v",
	},
}

return {
	config = config,
	keys = keys,
}
