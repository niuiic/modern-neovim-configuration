return {
	config = function()
		local sources = require("blink.cmp.sources.lib")
		local listen_on_completions = sources.listen_on_completions
		---@diagnostic disable-next-line: duplicate-set-field
		sources.listen_on_completions = function(callback)
			local function cb(context, items)
				for _, item in ipairs(items) do
					if
						item.textEdit
						and item.insertTextFormat ~= vim.lsp.protocol.InsertTextFormat.Snippet
						and string.find(item.textEdit.newText, "%$%d")
					then
						item.insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet
					end
				end

				callback(context, items)
			end

			listen_on_completions(cb)
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
			sources = {
				completion = {
					enabled_providers = { "lsp", "path", "buffer", "snippets", "ripgrep" },
				},
				providers = {
					path = { name = "Path", module = "blink.cmp.sources.path", score_offset = 4 },
					lsp = { name = "LSP", module = "blink.cmp.sources.lsp", score_offset = 3 },
					ripgrep = { name = "Ripgrep", module = "blink-cmp-rg", score_offset = 2 },
					buffer = { name = "Buffer", module = "blink.cmp.sources.buffer", score_offset = 1 },
					snippets = { name = "Snippets", module = "blink.cmp.sources.snippets", score_offset = 0 },
				},
			},
			fuzzy = {
				prebuiltBinaries = { download = false },
				sorts = { "score" },
			},
			trigger = {
				signature_help = {
					enabled = true,
				},
			},
			windows = {
				autocomplete = {
					border = "rounded",
					winhighlight = "Normal:None,FloatBorder:BlinkCmpDocBorder,CursorLine:CursorLine,Search:None",
				},
				documentation = {
					auto_show = true,
					border = "rounded",
				},
				signature_help = {
					border = "rounded",
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
