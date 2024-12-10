local keys = {
	{
		"<space>lF",
		function()
			require("lsp-commands").run_command(function(name)
				return string.find(name, "rename file") ~= nil
			end)
		end,
		desc = "rename file",
	},
	{
		"<space>lr",
		function()
			require("lsp-commands").run_command(function(name)
				return string.find(name, "rename var") ~= nil
			end)
		end,
		desc = "rename var",
	},
	{
		"<space>lR",
		function()
			require("lsp-commands").run_command(function(name)
				return string.find(name, "rename file") ~= nil
			end)
		end,
		desc = "rename file",
	},
	{
		"<space>li",
		function()
			require("lsp-commands").run_command(function(name)
				return string.find(name, "organize imports") ~= nil
			end)
		end,
		desc = "organize imports",
	},
	{
		"<space>lf",
		function()
			require("lsp-commands").run_command(function(name)
				return string.find(name, "fix all") ~= nil
			end)
		end,
		desc = "fix all",
	},
	{
		"<space>ll",
		function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
		end,
		desc = "toggle inlay hint",
	},
	{
		"<space>lp",
		function()
			require("lsp-commands").run_command(function(name)
				return string.find(name, "copy path") ~= nil
			end)
		end,
		desc = "copy path",
	},
	{
		"gj",
		function()
			vim.diagnostic.goto_next({ float = false })
		end,
		desc = "jump to next diagnostic",
	},
	{
		"gJ",
		function()
			vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, float = false })
		end,
		desc = "jump to next error",
	},
	{
		"gk",
		function()
			vim.diagnostic.goto_prev({ float = false })
		end,
		desc = "jump to previous diagnostic",
	},
	{
		"gK",
		function()
			vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, float = false })
		end,
		desc = "jump to previous error",
	},
	{
		"J",
		vim.lsp.buf.hover,
		desc = "lsp hover",
	},
	{
		"D",
		function()
			vim.diagnostic.open_float({
				source = true,
				border = "rounded",
			})
		end,
	},
}

return { keys = keys }
