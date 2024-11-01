local basic_parser = function(output, pattern)
	local lines = vim.split(output, "\n")
	local qf_item
	local qf_list = {}
	local index = 1
	for _, line in ipairs(lines) do
		local file, line_nr, msg = string.match(line, pattern)
		msg = msg or ""
		if file and line then
			if qf_item then
				table.insert(qf_list, qf_item)
			end
			qf_item = { filename = file, lnum = tonumber(line_nr), text = string.format("[%s]\n%s", index, msg) }
			index = index + 1
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
			make = {
				node = {
					cmd = "node",
					args = { vim.api.nvim_buf_get_name(0) },
					is_enabled = function()
						return vim.bo.filetype == "javascript"
					end,
					parser = "node",
				},
				rust = {
					cmd = "cargo",
					args = { "build" },
					options = {
						cwd = vim.fs.root(0, "Cargo.toml"),
					},
					is_enabled = function()
						return vim.fs.root(0, "Cargo.toml")
					end,
					parser = "rust",
				},
			},
			parser = {
				node = function(_, err)
					basic_parser(err, "^(%S+):(%d+):?(.*)")
				end,
				rust = function(_, err)
					basic_parser(err, "--> (%S+):(%d+):%d+")
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
			"<space>qd",
			function()
				require("quickfix").remove()
			end,
			desc = "remove quickfix item",
		},
		{
			"<space>qm",
			function()
				require("quickfix").make()
			end,
			desc = "make",
		},
	},
}
