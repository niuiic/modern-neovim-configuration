return {
	config = function()
		local function plantuml(context, apply_change)
			vim.system({
				"pumlformat",
			}, {
				stdin = context.text,
			}, function(result)
				if result.code == 0 then
					apply_change(context.text, result.stdout, context.bufnr)
				end
			end)
		end

		local function d2(context, apply_change)
			local cache_dir = vim.fn.stdpath("cache")
			---@cast cache_dir string
			local cache_file = vim.fs.joinpath(cache_dir, os.time() .. ".d2")
			vim.uv.fs_copyfile(context.file_path, cache_file)
			vim.system({
				"d2",
				"fmt",
				cache_file,
			}, {}, function(result)
				vim.schedule(function()
					if result.code == 0 then
						apply_change(context.text, vim.fn.join(vim.fn.readfile(cache_file), "\n"), context.bufnr)
					end
					vim.fn.delete(cache_file)
				end)
			end)
		end

		local function ruff(context, apply_change)
			local args = {
				"ruff",
				"format",
				"--stdin-filename",
				vim.api.nvim_buf_get_name(context.bufnr),
			}

			vim.system(args, { stdin = context.text }, function(result)
				if result.code == 0 then
					apply_change(context.text, result.stdout, context.bufnr)
				end
			end)
		end

		local function sqruff(context, apply_change)
			vim.system({ "sqruff", "fix", "-" }, { stdin = context.text }, function(result)
				if result.code == 0 then
					apply_change(context.text, result.stdout, context.bufnr)
				end
			end)
		end

		-- mirrors the old `deno fmt --no-semicolons --single-quote` behaviour; the
		-- remaining defaults match deno's (80 columns, 2-space tabs, trailing
		-- commas, always-wrap prose). `--no-script` stops bun from running a
		-- project's `fmt` package.json script instead of formatting.
		local function bun(context, apply_change)
			vim.system({
				"bun",
				"fmt",
				"--no-script",
				"--no-config",
				"--no-editorconfig",
				"--no-semi",
				"--single-quote",
				"--print-width",
				"80",
				"--tab-width",
				"2",
				"--trailing-comma",
				"all",
				"--prose-wrap",
				"always",
				"--stdin-filepath",
				context.file_path,
			}, {
				stdin = context.text,
			}, function(result)
				if result.code == 0 then
					apply_change(context.text, result.stdout, context.bufnr)
				end
			end)
		end

		local function gofmt(context, apply_change)
			vim.system({
				"gofmt",
			}, {
				stdin = context.text,
			}, function(result)
				if result.code == 0 then
					apply_change(context.text, result.stdout, context.bufnr)
				end
			end)
		end

		require("format").setup({
			format_on_save = true,
			filetypes = {
				javascript = bun,
				typescript = bun,
				javascriptreact = bun,
				typescriptreact = bun,
				markdown = bun,
				html = bun,
				yaml = bun,
				yml = bun,
				css = bun,
				scss = bun,
				json = bun,
				jsonc = bun,
				sql = sqruff,
				json5 = bun,
				vue = bun,
				d2 = d2,
				plantuml = plantuml,
				python = ruff,
				go = gofmt,
			},
		})
	end,
	branch = "dev",
}
