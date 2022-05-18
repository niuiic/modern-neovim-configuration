local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("not found null-ls")
	return
end

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
		formatting.sqlformat.with({
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
