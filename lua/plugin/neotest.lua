---@diagnostic disable: missing-fields
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
					return string.match(file, "^.+%.py$") ~= nil
				end,
			}),
			require("tools.is_deno_project")() and nil or require("neotest-vitest")({
				cwd = function()
					return vim.fs.root(0, "package.json")
				end or nil,
			}),
			require("tools.is_deno_project")() and require("neotest-deno") or nil,
			require("neotest-rust")({
				args = { "--no-capture" },
				dap_adapter = "lldb",
			}),
			require("tools.is_deno_project")() and nil or require("neotest-jest")({
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
			}) or nil,
		},
	})

	vim.api.nvim_create_autocmd("BufEnter", {
		callback = vim.schedule_wrap(function(args)
			if vim.bo.filetype == "neotest-output" then
				vim.api.nvim_buf_set_keymap(args.buf, "n", "q", "", {
					callback = function()
						pcall(vim.api.nvim_buf_delete, args.buf, { force = true })
					end,
				})
			end
		end),
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
		"<space>tD",
		function()
			require("neotest").run.run_last({ strategy = "dap" })
		end,
		desc = "debug the last nearest test",
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
			require("neotest").output.open({ auto_close = true, enter = true })
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
		"haydenmeade/neotest-jest",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-python",
		"rouge8/neotest-rust",
		"MatrosMartz/neotest-deno",
	},
}
