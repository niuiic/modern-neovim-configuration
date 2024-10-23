local config = function()
	local cmp = require("cmp")

	cmp.setup({
		formatting = {
			format = require("lspkind").cmp_format({
				mode = "symbol_text",
				symbol_map = {
					Text = "󰉿",
					String = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "",
				},
				menu = {
					buffer = "[Buffer]",
					nvim_lsp = "[Lsp]",
					luasnip = "[LuaSnip]",
					rg = "[Rg]",
					treesitter = "[Treesitter]",
					async_path = "[Path]",
					crates = "[Crates]",
				},
			}),
		},
		enabled = function()
			return vim.api.nvim_get_option_value("buftype", {
				buf = 0,
			}) ~= "prompt" or require("cmp_dap").is_dap_buffer()
		end,
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp", group_index = 1 },
			{ name = "luasnip", group_index = 1 },
			{ name = "rg", option = { additional_arguments = "--hidden --smart-case" }, group_index = 2 },
			{ name = "buffer", group_index = 2 },
			{ name = "treesitter" },
			{ name = "async_path", group_index = 3 },
			{ name = "lazydev", group_index = 3 },
			{ name = "crates", group_index = 4 },
		}),
		preselect = cmp.PreselectMode.None,
	})

	cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
		sources = { { name = "dap" } },
	})

	cmp.setup.cmdline({ "/", "?" }, {
		sources = { { name = "buffer" }, { name = "cmdline_history" } },
	})

	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			{ name = "cmdline" },
			{ name = "cmdline_history" },
		}),
	})

	local cmp_lsp_rs = require("cmp_lsp_rs")
	local comparators = cmp_lsp_rs.comparators
	cmp.setup.filetype({ "rust" }, {
		sorting = {
			comparators = {
				comparators.inscope_inherent_import,
				comparators.sort_by_label_but_underscore_last,
			},
		},
	})

	-- keymap
	cmp.setup({
		mapping = {
			["<C-k>"] = cmp.mapping(function(fallback)
				if not cmp.visible() then
					fallback()
					return
				end
				cmp.select_prev_item({
					behavior = cmp.SelectBehavior.Select,
				})
			end, { "i", "c" }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if not cmp.visible() then
					fallback()
					return
				end
				cmp.close()
			end, { "i", "c", "s" }),
			["<C-j>"] = cmp.mapping(function(fallback)
				if not cmp.visible() then
					fallback()
					return
				end
				cmp.select_next_item({
					behavior = cmp.SelectBehavior.Select,
				})
			end, { "i", "c" }),
			["<cr>"] = cmp.mapping(function(fallback)
				if not cmp.visible() then
					fallback()
					return
				end

				local entry = cmp.get_selected_entry()
				if not entry then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				end
				cmp.confirm({
					select = true,
					behavior = cmp.ConfirmBehavior.Insert,
				})
			end, { "i", "s", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-u>"] = cmp.mapping(function(fallback)
				if not cmp.visible() then
					fallback()
					return
				end
				for _ = 1, 10, 1 do
					cmp.select_prev_item({
						behavior = cmp.SelectBehavior.Select,
					})
				end
			end, { "i", "c" }),
			["<C-d>"] = cmp.mapping(function(fallback)
				if not cmp.visible() then
					fallback()
					return
				end
				for _ = 1, 10, 1 do
					cmp.select_next_item({
						behavior = cmp.SelectBehavior.Select,
					})
				end
			end, { "i", "c" }),
		},
	})
end

return {
	config = config,
	dependencies = {
		"onsails/lspkind-nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"FelipeLema/cmp-async-path",
		"rcarriga/cmp-dap",
		"LiadOz/nvim-dap-repl-highlights",
		"hrsh7th/cmp-cmdline",
		"dmitmel/cmp-cmdline-history",
		"lukas-reineke/cmp-rg",
		"ray-x/cmp-treesitter",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"zjp-CN/nvim-cmp-lsp-rs",
	},
}
