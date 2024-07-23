local config = function()
	local neotest = require("neotest")

	neotest.setup({
		quickfix = {
			enabled = false,
		},
		diagnostic = {
			enabled = false,
		},
		adapters = {
			require("neotest-python")({
				args = { "--capture=no" },
				is_test_file = function(file)
					local core = require("core")
					return core.file.extension(file) == "py"
				end,
			}),
			require("neotest-vitest"),
			require("rustaceanvim.neotest"),
			require("neotest-jest")({
				jestCommand = "pnpm jest",
				jestConfigFile = function(file)
					if string.find(file, "/packages/") then
						return string.match(file, "(.-/[^/]+/)src") .. "jest.config.json"
					end
					return vim.fn.getcwd() .. "/jest.config.json"
				end,
				cwd = function(file)
					if string.find(file, "/packages/") then
						return string.match(file, "(.-/[^/]+/)src")
					end
					return vim.fn.getcwd()
				end,
				env = { CI = true },
			}),
		},
	})
end

local keys = {
	{
		"tj",
		function()
			require("neotest").jump.next({ status = "failed" })
		end,
		desc = "jump to next failed test",
	},
	{
		"tk",
		function()
			require("neotest").jump.prev({ status = "failed" })
		end,
		desc = "jump to previous failed test",
	},
	{
		"<space>tr",
		function()
			require("neotest").run.run()
		end,
		desc = "run nearest test",
	},
	{
		"<space>tR",
		function()
			require("neotest").run.run(vim.fn.expand("%"))
		end,
		desc = "run all tests in current file",
	},
	{
		"<space>tw",
		function()
			require("neotest").watch.toggle()
		end,
		desc = "watch nearest test",
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
			require("neotest").output.open({ auto_close = true })
		end,
		desc = "open result window",
	},
	{
		"<space>tO",
		function()
			require("neotest").summary.toggle()
		end,
		desc = "toggle summary window",
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
		"haydenmeade/neotest-jest",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-python",
	},
}
