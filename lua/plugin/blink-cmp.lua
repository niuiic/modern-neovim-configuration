---@diagnostic disable: missing-fields
return {
	config = function()
		local sources = require("blink.cmp.sources.lib")
		---@diagnostic disable-next-line: duplicate-set-field
		function sources.get_enabled_providers(context)
			local config = require("blink.cmp.config")
			local mode_providers = type(config.sources.completion.enabled_providers) == "function"
					and config.sources.completion.enabled_providers(context)
				or config.sources.completion.enabled_providers
			--- @cast mode_providers string[]

			for _, provider in ipairs(mode_providers) do
				-- initialize the provider if it hasn't been initialized yet
				if not sources.providers[provider] then
					sources.providers[provider] =
						require("blink.cmp.sources.lib.provider").new(provider, config.sources.providers[provider])
				end
			end

			--- @type table<string, blink.cmp.SourceProvider>
			local providers = {}
			for key, provider in pairs(sources.providers) do
				if vim.tbl_contains(mode_providers, key) and provider:enabled(context) then
					providers[key] = provider
				end
			end
			return providers
		end

		require("blink.cmp").setup({
			keymap = {
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-l>"] = { "accept" },
				["<A-j>"] = { "snippet_forward", "fallback" },
				["<A-k>"] = { "snippet_backward", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},
			completion = {
				menu = {
					border = "rounded",
					winhighlight = "Normal:None,FloatBorder:BlinkCmpDocBorder,CursorLine:CursorLine,Search:None",
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 50,
					window = {
						border = "rounded",
					},
				},
			},
			fuzzy = {
				prebuiltBinaries = { download = false },
				sorts = { "score" },
			},
			sources = {
				completion = {
					enabled_providers = { "lsp", "path", "buffer", "snippets", "ripgrep" },
				},
				providers = {
					path = { name = "Path", module = "blink.cmp.sources.path", score_offset = 4 },
					lsp = {
						name = "LSP",
						module = "blink.cmp.sources.lsp",
						score_offset = 3,
						transform_items = function(_, items)
							if vim.bo.filetype == "vue" then
								for _, item in ipairs(items) do
									if
										item.textEdit
										and item.insertTextFormat ~= vim.lsp.protocol.InsertTextFormat.Snippet
										and string.find(item.textEdit.newText, "%$%d")
									then
										item.insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet
									end
								end
							end
							return items
						end,
					},
					ripgrep = { name = "Ripgrep", module = "blink-cmp-rg", score_offset = 2 },
					buffer = { name = "Buffer", module = "blink.cmp.sources.buffer", score_offset = 1 },
					snippets = {
						name = "Snippets",
						module = "blink.cmp.sources.snippets",
						score_offset = 0,
						opts = {
							get_filetype = function()
								local filetype = vim.bo.filetype

								if filetype == "vue" then
									local node = vim.treesitter.get_node()
									while node do
										if string.find(node:sexpr(), "(script_element", 1, true) == 1 then
											return "typescript"
										elseif string.find(node:sexpr(), "(template_element", 1, true) == 1 then
											return "html"
										elseif string.find(node:sexpr(), "(style_element", 1, true) == 1 then
											return "scss"
										end

										node = node:parent()
									end
								end

								return filetype
							end,
						},
					},
				},
			},
			signature = {
				enabled = true,
				window = {
					border = "rounded",
					winhighlight = "Normal:None,FloatBorder:BlinkCmpDocBorder",
				},
			},
		})

		local hl_groups = {
			BlinkCmpKindVariable = {
				fg = "#2ecc71",
			},
			BlinkCmpKindText = {
				fg = "#34495e",
			},
			BlinkCmpKindSnippet = {
				fg = "#f4d03f",
			},
		}
		vim.schedule(function()
			for key, value in pairs(hl_groups) do
				vim.api.nvim_set_hl(0, key, value)
			end
		end)
	end,
	build = "cargo build --release",
	dependencies = { "rafamadriz/friendly-snippets", "niuiic/blink-cmp-rg.nvim" },
}
