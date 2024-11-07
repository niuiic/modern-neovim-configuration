return {
	config = function()
		require("blink.cmp").setup({
			keymap = {
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<A-j>"] = { "snippet_forward", "fallback" },
				["<A-k>"] = { "snippet_backward", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-l>"] = { "accept", "fallback" },
				["<tab>"] = { "hide", "fallback" },
			},
			sources = {
				completion = { enabled_providers = { "lsp", "path", "buffer", "snippets", "ripgrep" } },
				providers = {
					path = { name = "Path", module = "blink.cmp.sources.path", score_offset = 4 },
					lsp = { name = "LSP", module = "blink.cmp.sources.lsp", score_offset = 3 },
					snippets = { name = "Snippets", module = "blink.cmp.sources.snippets", score_offset = 2 },
					ripgrep = { name = "Ripgrep", module = "blink-cmp-rg", score_offset = 1 },
					buffer = { name = "Buffer", module = "blink.cmp.sources.buffer", score_offset = 0 },
				},
			},
			fuzzy = {
				prebuiltBinaries = { download = false },
				sorts = { "score" },
			},
			trigger = {
				completion = {
					show_on_x_blocked_trigger_characters = { "'", '"', "`", "(", "{", "[" },
				},
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
					auto_show_delay_ms = 0,
					border = "rounded",
				},
				signature_help = {
					border = "rounded",
				},
			},
		})
	end,
	build = "cargo build --release",
	dependencies = { "rafamadriz/friendly-snippets", "niuiic/blink-cmp-rg.nvim" },
}
