return {
	config = function()
		local biome_config_path = (vim.fs.root(0, ".git") or vim.fn.getcwd()) .. "/biome.json"
		if not vim.uv.fs_stat(biome_config_path) then
			local config_dir = vim.fn.stdpath("config")
			if type(config_dir) == "table" then
				config_dir = config_dir[1]
			end
			biome_config_path = config_dir .. "/biome.json"
		end

		local function biome(context, apply_diff)
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
					apply_diff(context.text, result.stdout, context.bufnr)
				end
			end)
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
			},
		})
	end,
	branch = "dev",
}
