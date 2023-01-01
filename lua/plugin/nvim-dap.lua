local config = function()
	local dapui = require("dapui")
	local dap = require("dap")

	dapui.setup()

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open({})
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close({})
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close({})
	end

	require("nvim-dap-virtual-text").setup({})

	require("debugger")
end

local keys = {
	{
		"<space>dt",
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "toggle breakpoint",
	},
	{
		"<space>dT",
		function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
		desc = "set conditional breakpoint",
	},
	{
		"<space>dc",
		function()
			require("dap").continue()
		end,
		desc = "continue",
	},
	{
		"<space>di",
		function()
			require("dap").step_into()
		end,
		desc = "step into",
	},
	{
		"<space>do",
		function()
			require("dap").step_out()
		end,
		desc = "step out",
	},
	{
		"<space>dn",
		function()
			require("dap").step_over({})
		end,
		desc = "step over",
	},
	{
		"<space>db",
		function()
			require("dap").step_back()
		end,
		desc = "step back",
	},
	{
		"<space>dq",
		function()
			require("dap").terminate()
			require("dapui").close({})
		end,
		desc = "quit debug",
	},
	{
		"<space>dl",
		function()
			require("dap").run_last()
		end,
		desc = "run last",
	},
	{
		"<space>dr",
		function()
			require("dap").repl.open()
		end,
		desc = "repl",
	},
	{
		"<space>dj",
		function()
			require("goto-breakpoints").next()
		end,
		desc = "go to next breakpoint",
	},
	{
		"<space>dk",
		function()
			require("goto-breakpoints").prev()
		end,
		desc = "go to previous breakpoint",
	},
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
		"<A-t>",
		function()
			require("dap").toggle_breakpoint()
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
		"<AC-t>",
		function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
	},
}

return {
	config = config,
	keys = keys,
}
