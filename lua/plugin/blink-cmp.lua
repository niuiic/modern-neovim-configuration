return {
	config = function()
		local sources = require("blink.cmp.sources.lib")
		local listen_on_completions = sources.listen_on_completions
		---@diagnostic disable-next-line: duplicate-set-field
		sources.listen_on_completions = function(callback)
			local function cb(context, items)
				local item_map = {}
				for _, item in ipairs(items) do
					local key = string.format("%s,%s", item.label, item.kind)
					item_map[key] = item
				end
				callback(context, vim.tbl_values(item_map))
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
