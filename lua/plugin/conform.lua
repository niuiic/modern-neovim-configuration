return {
	config = function()
		require("conform").formatters.rustfmt = {
			prepend_args = {
				"--config",
				"imports_granularity=Crate,group_imports=StdExternalCrate",
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
				-- sqlfluff
				sql = { "sqlfluff" },
				-- taplo
				toml = { "taplo" },
				-- clang-format
				c = { "clang_format" },
				cpp = { "clang_format" },
				glsl = { "clang_format" },
				-- golines
				go = { "golines" },
				-- nginxbeautifier
				nginx = { "nginxbeautifier" },
				elixir = { "mixformat" },
				-- typstfmt
				typst = { "typstfmt" },
				-- alejandra
				nix = { "alejandra" },
				-- xmlformat
				svg = { "xmlformat" },
			},
		})
	end,
	keys = {
		{
			"<C-f>",
			function()
				require("conform").format({ async = true })
			end,
			desc = "format",
		},
	},
}
