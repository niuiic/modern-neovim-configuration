return {
	config = function()
		require("fittencode").setup({})
	end,
	keys = {
		{
			"<leader>fd",
			"<cmd>Fitten document_code<cr>",
			desc = "document code",
			mode = "x",
		},
		{
			"<leader>fe",
			"<cmd>Fitten explain_code<cr>",
			desc = "explain code",
			mode = "x",
		},
		{
			"<leader>ff",
			"<cmd>Fitten find_bugs<cr>",
			desc = "find bugs",
			mode = "x",
		},
		{
			"<leader>fg",
			"<cmd>Fitten generate_unit_test<cr>",
			desc = "generate unit test",
			mode = "x",
		},
		{
			"<leader>fi",
			"<cmd>Fitten implement_features<cr>",
			desc = "implement features",
			mode = "x",
		},
		{
			"<leader>fo",
			"<cmd>Fitten optimize_code<cr>",
			desc = "optimize code",
			mode = "x",
		},
		{
			"<leader>fr",
			"<cmd>Fitten refactor_code<cr>",
			desc = "refactor code",
			mode = "x",
		},
		{
			"<leader>fl",
			"<cmd>Fitten identify_programming_language<cr>",
			desc = "identify programming language",
			mode = "x",
		},
		{
			"<leader>fa",
			"<cmd>Fitten analyze_data<cr>",
			desc = "analyze data",
			mode = "x",
		},
		{
			"<leader>tc",
			"<cmd>Fitten toggle_chat<cr>",
			desc = "toggle chat",
		},
	},
	event = "VeryLazy",
}
