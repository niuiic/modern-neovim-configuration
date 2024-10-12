return {
	config = function()
		require("part-edit").setup({
			swap_path = function()
				local work_path = vim.fs.root(0, ".git") or vim.fn.getcwd()
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
