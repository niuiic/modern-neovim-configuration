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
		formatting.sql_formatter.with({
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
				"glsl",
				"wgsl",
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
				"graphql",
				"markdown",
				"yaml",
			},
		}),
		formatting.golines.with({
			filetypes = {
				"go",
			},
		}),
	},
})

-- keymap
utils.fn.map("n", "<AC-l>", ":lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", utils.var.opt)

-- glsl diagnostics
local function glsl()
	return {
		method = null_ls.methods.DIAGNOSTICS,
		filetypes = { "glsl" },
		generator = null_ls.generator({
			command = "glslangValidator",
			args = { "--stdin", "-S", "$FILEEXT" },
			to_stdin = true,
			from_stderr = true,
			format = "raw",
			check_exit_code = function(code, stderr)
				local success = code <= 1
				if not success then
					print(stderr)
				end

				return success
			end,
			on_output = function(params, done)
				if params and params.output then
					local diagnostics = {}
					local lines = vim.split(params.output, "\n")
					local sever, col, row, message = string.match(lines[2], "(%u+):%s(%d+):(%d+):.*:%s+(.*)")

					table.insert(diagnostics, {
						row = row,
						col = col + 1,
						end_col = col + 2,
						source = "GLSLang",
						message = message,
						severity = require("null-ls.helpers").diagnostics.severities[vim.fn.tolower(sever)],
					})
					done(diagnostics)
				else
					done()
				end
			end,
		}),
	}
end

null_ls.register(glsl())
