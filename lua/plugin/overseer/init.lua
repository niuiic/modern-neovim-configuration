local modules = { "rust" }

return {
	config = function()
		local overseer = require("overseer")

		overseer.setup({ templates = {}, task_list = {
			max_height = { 30 },
		} })

		vim.iter(modules):each(function(module)
			local templates = require("plugin.overseer." .. module)
			vim.iter(templates):each(function(template)
				overseer.register_template(template)
			end)
		end)
	end,
	keys = {
		{
			"<space>sr",
			function()
				require("overseer").run_template()
			end,
			desc = "launch task",
		},
		{
			"<space>so",
			function()
				require("overseer").toggle()
			end,
			desc = "preview task",
		},
	},
}
