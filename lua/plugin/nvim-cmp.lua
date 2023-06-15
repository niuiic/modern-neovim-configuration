local config = function()
	local cmp = require("cmp")

	cmp.setup({
		enabled = function()
			return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
		end,
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp", group_index = 1 },
			{ name = "luasnip", group_index = 1 },
			{ name = "buffer", group_index = 2 },
			{ name = "rg", option = { additional_arguments = "--hidden --smart-case" }, group_index = 2 },
			{ name = "async_path", group_index = 3 },
			{ name = "crates", group_index = 4 },
		}),
	})

	cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
		sources = {
			{ name = "dap" },
		},
	})

	cmp.setup.cmdline("/", {
		sources = {
			{ name = "buffer" },
			{ name = "cmdline_history" },
		},
	})

	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			{ name = "async_path" },
		}, {
			{ name = "cmdline" },
			{ name = "cmdline_history" },
		}),
	})

	cmp.setup({
		formatting = {
			format = require("lspkind").cmp_format({
				mode = "symbol",
				maxwidth = 50,
			}),
		},
	})

	-- keymap
	cmp.setup({
		mapping = {
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<CR>"] = cmp.mapping.confirm({
				select = true,
				behavior = cmp.ConfirmBehavior.Replace,
			}),
			["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		},
	})
end

return {
	config = config,
}
