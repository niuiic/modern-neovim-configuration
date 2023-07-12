local config = function()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting

	null_ls.setup({
		sources = {
			formatting.shfmt.with({
				filetypes = {
					"sh",
					"zsh",
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
			formatting.google_java_format.with({
				filetypes = {
					"java",
				},
			}),
			formatting.rustfmt.with({
				filetypes = {
					"rust",
				},
				extra_args = { "--edition=2021" },
			}),
			formatting.sqlfluff.with({
				extra_args = { "--dialect", "postgres" },
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
					"dot",
					"tex",
					"plaintex",
				},
			}),
			formatting.golines.with({
				filetypes = {
					"go",
				},
			}),
			formatting.xmlformat.with({
				filetypes = {
					"svg",
					"xml",
				},
				generator_opts = {
					command = "xmlformat",
					args = { "--selfclose", "-" },
					to_stdin = true,
				},
			}),
			formatting.dart_format.with({
				filetypes = {
					"dart",
				},
			}),
			formatting.nginx_beautifier.with({
				filetypes = {
					"nginx",
				},
			}),
		},
	})

	-- keymap
	vim.keymap.set("n", "<C-g>", function()
		vim.lsp.buf.format({ timeout_ms = 2000 })
	end, { silent = true })

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
end

return {
	config = config,
	dependencies = "nvim-lua/plenary.nvim",
}
