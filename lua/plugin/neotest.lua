local config = function()
	local neotest = require("neotest")

	neotest.setup({
		adapters = {
			require("neotest-jest"),
			require("neotest-go"),
			require("neotest-vim-test")({
				ignore_file_types = { "vim", "lua" },
			}),
		},
	})
end

local keys = {
	{ ";j", "<Plug>(ultest-next-fail)" },
	{ ";k", "<Plug>(ultest-prev-fail)" },
	{
		"<leader>tr",
		function()
			require("neotest").run.run()
		end,
		desc = "run all tests in project",
	},
	{
		"<leader>tc",
		function()
			require("neotest").run.run(vim.fn.expand("%"))
		end,
		desc = "run all tests in current file",
	},
	{
		"<leader>td",
		function()
			require("neotest").run.run({ strategy = "dap" })
		end,
		desc = "debug the nearest test",
	},
	{
		"<leader>ts",
		function()
			require("neotest").run.stop()
		end,
		desc = "stop running tests",
	},
	{
		"<leader>ta",
		function()
			require("neotest").run.attach()
		end,
		desc = "attach to the nearest test",
	},
	{
		"<leader>to",
		function()
			require("neotest").output.open({ enter = true })
		end,
		desc = "open result window",
	},
	{
		"<leader>tO",
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
		-- "nvim-treesitter/nvim-treesitter" is required
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		-- adapters
		-- check more adapters on https://github.com/nvim-neotest/neotest#supported-runners
		"haydenmeade/neotest-jest",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-vim-test",
	},
}
