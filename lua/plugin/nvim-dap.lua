local utils = require("utils")
local dapui = utils.fn.require("dapui")
local dap = utils.fn.require("dap")

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 10,
			position = "bottom",
		},
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7"),
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

utils.fn.require("nvim-dap-virtual-text").setup({
	enabled = true, -- enable this plugin (the default)
	enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true, -- show stop reason when stopped for exceptions
	commented = false, -- prefix virtual text with comment string
	only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
	all_references = false, -- show virtual text on all all references of the variable (not only definitions)
	filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
	-- experimental features:
	virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
	all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
	virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
	virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
	-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})

-- keymap
utils.fn.whichKeyMap({
	d = {
		name = "debug",
		t = {
			function()
				dap.toggle_breakpoint()
			end,
			"toggle breakpoint",
		},
		c = {
			function()
				dap.continue()
			end,
			"continue",
		},
		i = {
			function()
				dap.step_into()
			end,
			"step into",
		},
		o = {
			function()
				dap.step_out()
			end,
			"step into",
		},
		n = {
			function()
				dap.step_over({})
			end,
			"step over",
		},
		b = {
			function()
				dap.step_back()
			end,
			"step back",
		},
		q = {
			function()
				dap.terminate()
			end,
			"quit debug",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

utils.fn.map("n", "<A-c>", "<Cmd>lua require('dap').continue()<CR>", utils.var.opt)
utils.fn.map("n", "<A-n>", "<Cmd>lua require('dap').step_over()<CR>", utils.var.opt)
utils.fn.map("n", "<A-t>", "<Cmd>lua require('dap').toggle_breakpoint()<CR>", utils.var.opt)
utils.fn.map("n", "<A-b>", "<Cmd>lua require('dap').step_back()<CR>", utils.var.opt)
utils.fn.map("n", "<A-i>", "<Cmd>lua require('dap').step_into()<CR>", utils.var.opt)
utils.fn.map("n", "<A-o>", "<Cmd>lua require('dap').step_out()<CR>", utils.var.opt)
