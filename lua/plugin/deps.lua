return {
	config = function()
		require("deps").add_dep({
			name = "d2 queries",
			is_installed = function()
				local data_dir = vim.fn.stdpath("data")
				---@cast data_dir string
				local target_dir = vim.fs.joinpath(data_dir, "lazy/nvim-treesitter/queries/d2")

				return vim.uv.fs_stat(target_dir) ~= nil
			end,
			install = function(notify)
				notify.start()
				local data_dir = vim.fn.stdpath("data")
				---@cast data_dir string
				local target_dir = vim.fs.joinpath(data_dir, "lazy/nvim-treesitter/queries/d2")

				local files = { "highlights.scm", "injections.scm", "locals.scm" }
				if vim.uv.fs_stat(target_dir) then
					vim.fn.system({ "rm", "-rf", target_dir })
				end
				vim.fn.system({ "mkdir", "-p", target_dir })
				require("omega").async(function()
					for _, file in ipairs(files) do
						require("omega").await(function(callback)
							local url = string.format(
								"https://github.com/ravsii/tree-sitter-d2/raw/refs/heads/main/queries/%s",
								file
							)
							vim.system({ "curl", "-L", "-o", vim.fs.joinpath(target_dir, file), url }, {}, function()
								callback()
							end)
						end)
					end
					notify.finish()
				end)()
			end,
			uninstall = function(notify)
				notify.start()
				local data_dir = vim.fn.stdpath("data")
				---@cast data_dir string
				local target_dir = vim.fs.joinpath(data_dir, "lazy/nvim-treesitter/queries/d2")

				if vim.uv.fs_stat(target_dir) then
					vim.fn.system({ "rm", "-rf", target_dir })
				end
				notify.finish()
			end,
		})

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
