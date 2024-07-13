return {
	config = function()
		require("part-edit").setup({
			swap_path = function()
				local work_path = require("core").file.root_path()
				return string.format("%s%s", string.gsub(work_path, "/", "_"), "_swap")
			end,
		})
	end,
	keys = {
		{
			"<space>p",
			"<cmd>PartEdit<cr>",
			desc = "edit selected code",
			mode = "x",
			silent = true,
		},
	},
}
