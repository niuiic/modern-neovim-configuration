return {
	config = function()
		require("typescript-tools").setup({
			handlers = { ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }) },
		})

		vim.api.nvim_create_user_command("TsOrganizeImports", function()
			vim.cmd("TSToolsOrganizeImports")
			vim.cmd("TSToolsAddMissingImports")
		end, {})

		vim.api.nvim_create_user_command("TsRename", function()
			vim.lsp.buf.rename(nil, {
				name = "typescript-tools",
			})
		end, {})
	end,
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
}
