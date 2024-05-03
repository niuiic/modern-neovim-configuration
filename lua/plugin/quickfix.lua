local basic_parser = function(output, regex)
	local lines = vim.split(output, "\n")
	local qf_item
	local qf_list = {}
	for _, line in ipairs(lines) do
		local file, line_nr, msg = string.match(line, regex)
		if file and line then
			if qf_item then
				table.insert(qf_list, qf_item)
			end
			qf_item = { filename = file, lnum = tonumber(line_nr), text = msg }
		else
			if qf_item then
				qf_item.text = qf_item.text .. "\n" .. line
			end
		end
	end
	table.insert(qf_list, qf_item)
	vim.fn.setqflist(qf_list)
end

return {
	config = function()
		require("quickfix").setup({
			parser = {
				node = function(_, err)
					basic_parser(err, "^(%S+):(%d+):?(.*)")
				end,
				tsc = function(output)
					basic_parser(output, "^(%S+)%((%d+),%d+%):(.*)")
				end,
			},
		})
	end,
	keys = {
		{
			"<space>qo",
			function()
				require("trouble").toggle("quickfix")
			end,
			desc = "open quickfix window",
		},
		{
			"<space>qm",
			function()
				require("quickfix").make()
			end,
			desc = "make",
		},
	},
	dependencies = {
		"niuiic/core.nvim",
	},
}
