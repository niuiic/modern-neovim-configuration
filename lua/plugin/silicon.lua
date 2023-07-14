return {
	config = function()
		require("silicon").setup({
			font = "Agave Nerd Font=16",
			theme = "Solarized (dark)",
			line_number = true,
		})
	end,
	build = "./install.sh build",
	keys = {
		{
			"<space>P",
			function()
				local core = require("core")
				local default_path = core.file.root_path() .. "/code.png"
				vim.ui.input({ prompt = "Image path: ", default = default_path }, function(input)
					if input == nil then
						return
					end
					vim.cmd("Silicon " .. input)
				end)
			end,
			desc = "code shot",
			mode = "v",
		},
	},
}
