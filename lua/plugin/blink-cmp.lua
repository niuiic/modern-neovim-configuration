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
			sources = {
				providers = {
					{ "blink.cmp.sources.path", name = "Path", score_offset = 4 },
					{ "blink.cmp.sources.lsp", name = "LSP", score_offset = 3 },
					{ "blink.cmp.sources.snippets", name = "Snippets", score_offset = 2 },
					{ "blink-cmp-rg", name = "Rg", score_offset = 1 },
					{ "blink.cmp.sources.buffer", name = "Buffer", score_offset = 0 },
				},
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
		})
	end,
	build = "cargo build --release",
	dependencies = { "rafamadriz/friendly-snippets", "niuiic/blink-cmp-rg.nvim" },
}
