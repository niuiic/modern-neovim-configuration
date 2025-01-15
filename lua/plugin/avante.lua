---@diagnostic disable: missing-fields
return {
	config = function()
		require("avante").setup({
			provider = "deepseek",
			vendors = {
				deepseek = {
					__inherited_from = "openai",
					api_key_name = "DEEPSEEK_API_KEY",
					endpoint = "https://api.deepseek.com",
					model = "deepseek-coder",
				},
			},
			behaviour = {
				auto_set_keymaps = false,
			},
		})
	end,
	keys = {
		{
			"<C-\\>",
			"<cmd>AvanteToggle<cr>",
		},
	},
	dependencies = {
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "Avante" },
			},
			ft = { "Avante" },
		},
	},
	build = "make BUILD_FROM_SOURCE=true",
	event = "VeryLazy",
}
