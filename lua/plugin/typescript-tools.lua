return {
	config = function()
		local core = require("core")
		local root_dir = core.file.root_path()

		if core.file.file_contains(root_dir .. "/package.json", "vue") then
			require("typescript-tools").setup({
				on_attach = function(client, bufnr)
					require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
					client.server_capabilities.semanticTokensProvider = nil
				end,
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
				},
				settings = {
					tsserver_plugins = { "@vue/typescript-plugin" },
				},
				handlers = { ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }) },
			})
		else
			require("typescript-tools").setup({
				on_attach = function(client, bufnr)
					require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
				end,
				handlers = { ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }) },
			})
		end

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
