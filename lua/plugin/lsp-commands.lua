local toggle_inlay_hint = function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end

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
				return string.find(name, "rename vars") ~= nil
			end)
		end,
		desc = "rename vars",
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
		toggle_inlay_hint,
		desc = "toggle inlay hint",
	},
	{
		"<space>lR",
		"<cmd>LspRestart *<cr>",
		desc = "restart all lsp",
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
}

return { keys = keys }
