local utils = require("utils")

local null_ls = utils.fn.require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		formatting.shfmt.with({
			filetypes = {
				"sh",
			},
		}),
		formatting.black.with({
			filetypes = {
				"python",
			},
		}),
		formatting.gofmt.with({
			filetypes = {
				"go",
			},
		}),
		formatting.cmake_format.with({
			filetypes = {
				"cmake",
			},
		}),
		formatting.rustfmt.with({
			filetypes = {
				"rust",
			},
		}),
		formatting.sqlfluff.with({
			filetypes = {
				"sql",
			},
		}),
		formatting.verible_verilog_format.with({
			filetypes = {
				"verilog",
				"systemverilog",
			},
		}),
		formatting.clang_format.with({
			filetypes = {
				"c",
				"cpp",
			},
		}),
		formatting.stylua.with({
			filetypes = {
				"lua",
			},
		}),
		formatting.taplo.with({
			filetypes = {
				"toml",
			},
		}),
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"graphql",
				"markdown",
			},
		}),
	},
})

-- keymap
utils.fn.map("n", "<AC-l>", ":lua vim.lsp.buf.format()<CR>", utils.var.opt)
