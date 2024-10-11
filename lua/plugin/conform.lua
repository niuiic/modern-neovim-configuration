return {
	config = function()
		local core = require("core")

		require("conform").formatters.rustfmt = {
			prepend_args = {
				"--config",
				"imports_granularity=Crate,group_imports=StdExternalCrate",
			},
		}

		local biome_config_path = core.file.root_path() .. "/biome.json"
		if not core.file.file_or_dir_exists(biome_config_path) then
			local config_dir = vim.fn.stdpath("config")
			if type(config_dir) == "table" then
				config_dir = config_dir[1]
			end
			biome_config_path = config_dir .. "/biome.json"
		end
		require("conform").formatters.biome = {
			args = {
				"format",
				"--stdin-file-path",
				"$FILENAME",
				"--config-path=" .. biome_config_path,
			},
		}

		require("conform").setup({
			formatters_by_ft = {
				-- stylua
				lua = { "stylua" },
				-- rustfmt
				rust = { "rustfmt" },
				-- prettier
				markdown = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },
				html = { "prettier" },
				graphql = { "prettier" },
				yaml = { "prettier" },
				dot = { "prettier" },
				tex = { "prettier" },
				plaintex = { "prettier" },
				vue = { "prettier" },
				-- biome
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				css = { "biome" },
				json = { "biome" },
				jsonc = { "biome" },
				-- black
				python = { "black" },
				-- shfmt
				sh = { "shfmt" },
				zsh = { "shfmt" },
				dockerfile = { "shfmt" },
				-- taplo
				toml = { "taplo" },
				-- typstfmt
				typst = { "typstfmt" },
				-- xmlformat
				svg = { "xmlformat" },
				-- lsp
				glsl = { lsp_format = "fallback" },
				wgsl = { lsp_format = "fallback" },
			},
			format_after_save = {},
		})
	end,
}
