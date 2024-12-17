---@diagnostic disable: missing-fields
return {
	config = function()
		require("blink.cmp").setup({
			keymap = {
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-l>"] = { "accept" },
				["<A-j>"] = { "snippet_forward", "fallback" },
				["<A-k>"] = { "snippet_backward", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-n>"] = { "fallback" },
				["<Tab>"] = { "fallback" },
				["<S-Tab>"] = { "fallback" },
			},
			completion = {
				menu = {
					border = "rounded",
					winhighlight = "Normal:None,FloatBorder:BlinkCmpDocBorder,CursorLine:CursorLine,Search:None",
				},
				accept = { auto_brackets = { enabled = false } },
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 50,
					window = {
						border = "rounded",
					},
				},
			},
			fuzzy = {
				prebuilt_binaries = { download = false },
				sorts = { "score" },
			},
			sources = {
				default = { "lsp", "path", "buffer", "snippets", "ripgrep" },
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
