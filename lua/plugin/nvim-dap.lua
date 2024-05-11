local config = function()
	local dapui = require("dapui")
	local dap = require("dap")

	dapui.setup()

	dap.listeners.after.event_initialized.dapui_config = function()
		vim.cmd("only")
		dapui.open({})
	end

	require("nvim-dap-virtual-text").setup()

	require("debugger")
end

local set_breakpoint = function()
	local types = { "log point", "conditional breakpoint", "exception breakpoint" }
	vim.ui.select(types, {
		prompt = "Select Breakpoint Types",
	}, function(choice)
		if choice == types[1] then
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		elseif choice == types[2] then
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "), vim.fn.input("Hit times: "))
		elseif choice == types[3] then
			vim.ui.input({ prompt = "Exception: " }, function(input)
				if input then
					require("dap").set_exception_breakpoints(input)
				else
					require("dap").set_exception_breakpoints("default")
				end
			end)
		end
	end)
end

local terminate_debug = function()
	local choice = vim.fn.confirm("Terminate program?", "&Yes\n&No")
	if not choice then
		return
	end

	if choice == 1 then
		require("dap").terminate()
	else
		require("dap").disconnect()
		require("dap").close()
	end

	require("dapui").close({})
	require("dap.repl").close({})
	require("nvim-dap-virtual-text/virtual_text").clear_virtual_text()
end

local keys = {
	{
		"<A-t>",
		function()
			require("dap").toggle_breakpoint()
		end,
	},
	{
		"<A-f>",
		function()
			require("dap").focus_frame()
		end,
	},
	{
		"<AC-t>",
		function()
			set_breakpoint()
		end,
		desc = "set log/conditional/exception point",
	},
	{
		"<space>dl",
		function()
			require("dap-utils").search_breakpoints()
		end,
		desc = "list all breakpoints",
	},
	{
		"<space>dc",
		function()
			require("dap-utils").clear_breakpoints()
			require("dap-utils").remove_watches()
		end,
		desc = "clear all breakpoints",
	},
	{
		"<space>dt",
		function()
			require("dap-utils").toggle_breakpoints()
		end,
		desc = "toggle all breakpoints",
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
			require("dap-utils").continue()
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
		"<A-w>",
		function()
			require("dapui").elements.watches.add()
		end,
		mode = { "n", "v" },
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
		terminate_debug,
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
		"M",
		function()
			local expression = require("core").text.selection()
			if vim.bo.filetype == "rust" then
				expression = "?" .. expression
			end
			require("dapui").eval(expression, {
				context = "repl",
			})
		end,
		desc = "check variable value",
		mode = { "n", "v" },
	},
}

return {
	config = config,
	keys = keys,
}
