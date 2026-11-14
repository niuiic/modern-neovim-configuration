return {
	config = function()
		require("deps").add_dep({
			name = "plantuml stdlib",
			is_installed = function()
				local data_dir = vim.fn.stdpath("data")
				---@cast data_dir string
				local target_dir = vim.fs.joinpath(data_dir, "plantuml-stdlib")

				return vim.uv.fs_stat(target_dir) ~= nil
			end,
			install = function(notify)
				notify.start()
				local data_dir = vim.fn.stdpath("data")
				---@cast data_dir string
				local target_dir = vim.fs.joinpath(data_dir, "plantuml-stdlib")

				vim.system(
					{ "git", "clone", "https://github.com/plantuml/plantuml-stdlib", target_dir },
					{},
					function(result)
						if result.code == 0 then
							notify.finish()
						else
							notify.fail(result.stderr)
						end
					end
				)
			end,
			update = function(notify)
				notify.start()
				local data_dir = vim.fn.stdpath("data")
				---@cast data_dir string
				local target_dir = vim.fs.joinpath(data_dir, "plantuml-stdlib")

				vim.system({ "git", "pull" }, { cwd = target_dir }, function(result)
					if result.code == 0 then
						notify.finish()
					else
						notify.fail(result.stderr)
					end
				end)
			end,
			uninstall = function(notify)
				notify.start()
				local data_dir = vim.fn.stdpath("data")
				---@cast data_dir string
				local target_dir = vim.fs.joinpath(data_dir, "plantuml-stdlib")

				if vim.uv.fs_stat(target_dir) then
					vim.fn.system({ "rm", "-rf", target_dir })
				end
				notify.finish()
			end,
		})
	end,
	keys = {
		{
			"<leader>nu",
			function()
				require("deps").update_deps()
			end,
			desc = "update dependencies",
		},
	},
}
