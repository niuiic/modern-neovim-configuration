local core = require("core")

local M = {
	cmd = { "sqls", "-config", core.file.root_path() .. "/.nvim/db.yml" },
	root_dir = core.file.root_path,
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "SqlsExec", function(args)
			local range
			if args.range ~= 0 then
				range = vim.lsp.util.make_given_range_params({ args.line1, 0 }, { args.line2, math.huge }).range
				range["end"].character = range["end"].character - 1
			end

			client.request("workspace/executeCommand", {
				command = "executeQuery",
				arguments = { vim.uri_from_bufnr(0), nil },
				range = range,
			}, function(err, result)
				if err then
					vim.notify("sqls: " .. err.message, vim.log.levels.ERROR)
					return
				end

				if not result then
					return
				end

				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				core.win.split_win(0, { direction = "hb", size = math.ceil(screen_h / 2), enter = true })
				vim.api.nvim_buf_set_lines(0, 0, 1, false, vim.split(result, "\n"))
				vim.api.nvim_set_option_value("filetype", "sqls_output", { buf = 0 })
			end)
		end, { range = true })
	end,
}

return M
