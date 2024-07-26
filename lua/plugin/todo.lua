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
				local core = require("core")
				require("todo").search_all(function(items)
					return core.lua.list.filter(items, function(item)
						return item.status ~= "DONE"
					end)
				end)
			end,
			desc = "search all todos",
		},
		{
			"<space>mu",
			function()
				local core = require("core")
				require("todo").search_upstream(function(items)
					return core.lua.list.filter(items, function(item)
						return item.status ~= "DONE"
					end)
				end)
			end,
			desc = "search upstream todos",
		},
		{
			"<space>md",
			function()
				local core = require("core")
				require("todo").search_downstream(function(items)
					return core.lua.list.filter(items, function(item)
						return item.status ~= "DONE"
					end)
				end)
			end,
			desc = "search downstream todos",
		},
	},
	lazy = false,
}
