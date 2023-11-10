local config = function()
	local neotest = require("neotest")
	local core = require("core")

	neotest.setup({
		quickfix = {
			enabled = false,
		},
		adapters = {
			require("neotest-jest")({
				jestCommand = "pnpm jest",
				jestConfigFile = "jest.config.cjs",
				env = { CI = true },
				cwd = function()
					local get_prev_level_path = function(currentPath)
						local tmp = string.reverse(currentPath)
						local _, i = string.find(tmp, "/")
						return string.sub(currentPath, 1, string.len(currentPath) - i)
					end

					local cur_dir = get_prev_level_path(vim.api.nvim_buf_get_name(0))
					while cur_dir ~= "" do
						if core.file.file_or_dir_exists(cur_dir .. "/jest.config.json") then
							return cur_dir
						else
							cur_dir = get_prev_level_path(cur_dir)
						end
					end

					return vim.fn.getcwd()
				end,
			}),
			require("neotest-go"),
			require("neotest-rust")({
				dap_adapter = "codelldb",
				args = { "--no-capture" },
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
		"nvim-neotest/neotest-go",
		"rouge8/neotest-rust",
	},
}
