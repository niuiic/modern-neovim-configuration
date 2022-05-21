require("lspconfig").volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	on_attach = function(_, bufnr)
		-- bind keymap
		require("utils").fn.setLspKeyMap(bufnr)
	end,
})
