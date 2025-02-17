return {
	config = function()
		local biome_config_path = (vim.fs.root(0, ".root") or vim.fs.root(0, ".git") or vim.fn.getcwd())
			.. "/biome.json"
		if not vim.uv.fs_stat(biome_config_path) then
			local config_dir = vim.fn.stdpath("config")
			if type(config_dir) == "table" then
				config_dir = config_dir[1]
			end
			biome_config_path = config_dir .. "/biome.json"
		end

		local function biome(context, apply_change)
			vim.system({
				"biome",
				"format",
				"--stdin-file-path",
				context.file_path,
				"--config-path=" .. biome_config_path,
			}, {
				stdin = context.text,
			}, function(result)
				if result.code == 0 then
					apply_change(context.text, result.stdout, context.bufnr)
				end
			end)
		end

		local function d2(context, apply_change)
			local cache_dir = vim.fn.stdpath("cache")
			---@cast cache_dir string
			local cache_file = vim.fs.joinpath(cache_dir, os.time() .. ".d2")
			vim.uv.fs_copyfile(context.file_path, cache_file)
			local result = vim.system({
				"d2",
				"fmt",
				cache_file,
			}, {}):wait()
			if result.code == 0 then
				apply_change(context.text, vim.fn.join(vim.fn.readfile(cache_file), "\n"), context.bufnr)
			end
			vim.fn.delete(cache_file)
		end

		require("format").setup({
			format_on_save = true,
			filetypes = {
				javascript = biome,
				typescript = biome,
				javascriptreact = biome,
				typescriptreact = biome,
				css = biome,
				json = biome,
				jsonc = biome,
				d2 = d2,
			},
		})
	end,
	branch = "dev",
}
