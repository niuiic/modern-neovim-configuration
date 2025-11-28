return {
	config = function()
		require("part-edit").add_strategy({
			name = "json js",
			from = function(lines)
				return vim.iter(lines)
					:map(function(line)
						return line:match('%"(.*)%"')
					end)
					:totable()
			end,
			to = function(lines)
				return vim.iter(lines)
					:map(function(line)
						return string.format('"%s",', line)
					end)
					:totable()
			end,
			file_suffix = "js",
		})
	end,
	keys = {
		{
			"<space>p",
			function()
				require("part-edit").start()
			end,
			desc = "edit selected code",
			mode = "x",
			silent = true,
		},
	},
}
