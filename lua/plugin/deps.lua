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
					vim.system({ "rm", "-rf", target_dir })
				end
				vim.system({ "mkdir", "-p", target_dir })
				for _, file in ipairs(files) do
					local url =
						string.format("https://github.com/ravsii/tree-sitter-d2/raw/refs/heads/main/queries/%s", file)
					vim.system({ "curl", "-L", "-o", vim.fs.joinpath(target_dir, file), url })
				end
				notify.finish()
			end,
			uninstall = function(notify)
				notify.start()
				local data_dir = vim.fn.stdpath("data")
				---@cast data_dir string
				local target_dir = vim.fs.joinpath(data_dir, "lazy/nvim-treesitter/queries/d2")

				if vim.uv.fs_stat(target_dir) then
					vim.system({ "rm", "-rf", target_dir })
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
