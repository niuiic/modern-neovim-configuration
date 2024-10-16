return {
	config = function()
		require("blink.cmp").setup({
			keymap = {
				show = "<C-space>",
				hide = "<C-q>",
				accept = "<cr>",
				select_prev = { "<C-k>" },
				select_next = { "<C-j>" },
				show_documentation = "<C-space>",
				hide_documentation = "<C-space>",
				scroll_documentation_up = "<C-b>",
				scroll_documentation_down = "<C-f>",
				snippet_forward = "<A-j>",
				snippet_backward = "<A-k>",
			},
			fuzzy = {
				prebuiltBinaries = {
					download = false,
				},
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
					auto_show_delay_ms = 0,
					border = "rounded",
				},
				signature_help = {
					border = "rounded",
				},
			},
			sources = {
				providers = {
					{ "blink.cmp.sources.lsp", name = "LSP" },
					{ "blink.cmp.sources.path", name = "Path", score_offset = 3 },
					{ "blink.cmp.sources.snippets", name = "Snippets", score_offset = -3 },
					{ "blink.cmp.sources.buffer", name = "Buffer", fallback_for = { "LSP" } },
				},
			},
		})
	end,
	build = "cargo build --release",
	dependencies = "rafamadriz/friendly-snippets",
}
