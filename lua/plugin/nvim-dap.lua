local utils = require("utils")
local dapui = utils.fn.require("dapui")
local dap = utils.fn.require("dap")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

utils.fn.require("nvim-dap-virtual-text").setup()

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
		T = {
			function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			"set conditional breakpoint",
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
			"step out",
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
		l = {
			function()
				dap.run_last()
			end,
			"run last",
		},
		r = {
			function()
				dap.repl.open()
			end,
			"repl",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

utils.fn.map("n", "<A-c>", "<Cmd>lua require('dap').continue()<CR>", utils.var.opt)
utils.fn.map("n", "<A-n>", "<Cmd>lua require('dap').step_over()<CR>", utils.var.opt)
utils.fn.map("n", "<A-t>", "<Cmd>lua require('dap').toggle_breakpoint()<CR>", utils.var.opt)
utils.fn.map(
	"n",
	"<AC-t>",
	"<Cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	utils.var.opt
)
utils.fn.map("n", "<A-b>", "<Cmd>lua require('dap').step_back()<CR>", utils.var.opt)
utils.fn.map("n", "<A-i>", "<Cmd>lua require('dap').step_into()<CR>", utils.var.opt)
utils.fn.map("n", "<A-o>", "<Cmd>lua require('dap').step_out()<CR>", utils.var.opt)
