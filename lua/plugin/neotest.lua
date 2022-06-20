local utils = require("utils")

local neotest = utils.fn.require("neotest")

neotest.setup({
	adapters = {
		require("neotest-jest"),
		require("neotest-go"),
		require("neotest-vim-test")({
			ignore_file_types = { "vim", "lua" },
		}),
	},
})

-- keymap
utils.fn.map("n", ";j", "<Plug>(ultest-next-fail)", utils.var.opt)
utils.fn.map("n", ";k", "<Plug>(ultest-prev-fail)", utils.var.opt)
utils.fn.whichKeyMap({
	t = {
		name = "test",
		r = {
			function()
				neotest.run.run()
			end,
			"run all tests in project",
		},
		c = {
			function()
				neotest.run.run(vim.fn.expand("%"))
			end,
			"run all tests in current file",
		},
		d = {
			function()
				neotest.run.run({ strategy = "dap" })
			end,
			"debug the nearest test",
		},
		s = {
			function()
				neotest.run.stop()
			end,
			"stop running tests",
		},
		a = {
			function()
				neotest.run.attach()
			end,
			"attach to the nearest test",
		},
		o = {
			function()
				neotest.output.open({ enter = true })
			end,
			"open result window",
		},
		O = {
			function()
				neotest.summary.open()
			end,
			"open summary window",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
