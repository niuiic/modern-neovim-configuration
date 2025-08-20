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

		local function deno(context, apply_change)
			vim.system({
				"deno",
				"fmt",
				"--no-semicolons",
				"--single-quote",
				"--line-width",
				"120",
				"--unstable-component",
				"--unstable-sql",
				"-",
			}, { stdin = context.text }, function(result)
				if result.code == 0 then
					apply_change(context.text, result.stdout, context.bufnr)
				end
			end)
		end

		require("format").setup({
			format_on_save = true,
			filetypes = {
				javascript = deno,
				typescript = deno,
				javascriptreact = deno,
				typescriptreact = deno,
				css = require("format.formatters.prettier"),
				json = deno,
				jsonc = deno,
				d2 = d2,
				plantuml = plantuml,
			},
		})
	end,
	branch = "dev",
}
