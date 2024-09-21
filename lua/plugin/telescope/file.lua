local core = require("core")

local search_file_in_workspace = function()
	require("telescope.builtin").find_files({
		hidden = true,
		cwd = core.file.root_path(),
		find_command = { "rg", "--files", "--glob", "!**/.git/*" },
	})
end

return {
	search_file_in_workspace = search_file_in_workspace,
}
