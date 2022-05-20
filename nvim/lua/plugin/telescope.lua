local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("not found telescope")
	return
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-c>"] = "close",
			},
		},
	},
	pickers = {},
	extensions = {},
})
