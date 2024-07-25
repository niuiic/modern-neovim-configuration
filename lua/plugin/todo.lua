return {
	config = function()
		require("todo").setup()
	end,
	keys = {
		{
			"<space>mA",
			function()
				require("todo").search_all()
			end,
			desc = "search all todos, including which was done",
		},
		{
			"<space>ma",
			function()
				require("todo").search_all(function(todo)
					return todo.status ~= "DONE"
				end)
			end,
			desc = "search all todos",
		},
		{
			"<space>mu",
			function()
				require("todo").search_upstream(function(todo)
					return todo.status ~= "DONE"
				end)
			end,
			desc = "search upstream todos",
		},
		{
			"<space>md",
			function()
				require("todo").search_downstream(function(todo)
					return todo.status ~= "DONE"
				end)
			end,
			desc = "search downstream todos",
		},
	},
	lazy = false,
}
