local utils = require("utils")
local filetypes = { "vue" }

if utils.fn.match_str_in_file(utils.fn.root_pattern() .. "/package.json", "vue") then
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
end

local M = {
	filetypes = filetypes,
	root_dir = utils.fn.root_pattern,
	init_options = {
		documentFeatures = {
			documentColor = false,
			documentFormatting = {
				defaultPrintWidth = 100,
			},
			documentSymbol = true,
			foldingRange = true,
			linkedEditingRange = true,
			selectionRange = true,
		},
		languageFeatures = {
			callHierarchy = true,
			codeAction = true,
			codeLens = true,
			completion = {
				defaultAttrNameCase = "kebabCase",
				defaultTagNameCase = "both",
			},
			definition = true,
			diagnostics = true,
			documentHighlight = true,
			documentLink = true,
			hover = true,
			implementation = true,
			references = true,
			rename = true,
			renameFileRefactoring = true,
			schemaRequestService = true,
			semanticTokens = false,
			signatureHelp = true,
			typeDefinition = true,
		},
		typescript = {
			serverPath = os.getenv("HOME")
				.. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/tsserverlibrary.js",
		},
	},
}

return M
