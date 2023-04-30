local config = function()
	local neotest = require("neotest")

	neotest.setup({
		adapters = {
			require("neotest-jest")({
				jestCommand = "pnpm jest --",
				jestConfigFile = "jest.config.cjs",
				env = { CI = true },
				cwd = function()
					return vim.fn.getcwd()
				end,
			}),
			require("neotest-go"),
		},
	})
end

local keys = {
	{ ";j", "<Plug>(ultest-next-fail)" },
	{ ";k", "<Plug>(ultest-prev-fail)" },
	{
		"<space>tr",
		function()
			require("neotest").run.run()
		end,
		desc = "run all tests in project",
	},
	{
		"<space>tc",
		function()
			require("neotest").run.run(vim.fn.expand("%"))
		end,
		desc = "run all tests in current file",
	},
	{
		"<space>td",
		function()
			require("neotest").run.run({ strategy = "dap" })
		end,
		desc = "debug the nearest test",
	},
	{
		"<space>ts",
		function()
			require("neotest").run.stop()
		end,
		desc = "stop running tests",
	},
	{
		"<space>ta",
		function()
			require("neotest").run.attach()
		end,
		desc = "attach to the nearest test",
	},
	{
		"<space>to",
		function()
			require("neotest").output.open({ enter = true })
		end,
		desc = "open result window",
	},
	{
		"<space>tO",
		function()
			require("neotest").summary.open()
		end,
		desc = "open summary window",
	},
}

return {
	config = config,
	keys = keys,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		-- adapters
		-- check more adapters on https://github.com/nvim-neotest/neotest#supported-runners
		{ "haydenmeade/neotest-jest", commit = "219033658bf8de6b91e201036a5cc5456905d9d2" },
		"nvim-neotest/neotest-go",
	},
}
