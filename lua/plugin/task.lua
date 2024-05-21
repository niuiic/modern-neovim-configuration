local ns_id = vim.api.nvim_create_namespace("Task")

return {
	keys = {
		{
			"<space>sr",
			function()
				local core = require("core")
				local uv = vim.loop

				local bufnr = vim.api.nvim_get_current_buf()
				local area = core.text.selected_area()
				if not area then
					return
				end
				local selection = core.text.selection()
				local buf_name = vim.api.nvim_buf_get_name(bufnr)
				local temp_file = string.format(
					"%s/_%s.%s",
					core.file.dir(buf_name),
					core.file.name(buf_name),
					core.file.extension(buf_name)
				)
				if core.file.file_or_dir_exists(temp_file) then
					return
				end
				local lines = core.lua.string.split(selection, "\n")
				vim.fn.writefile(lines, temp_file)

				require("task").run({
					name = "Dart",
					cmd = "dart",
					args = { "run", temp_file },
					on_success = function(_, output)
						vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

						if not output then
							return
						end

						local output_lines = core.lua.string.split(output, "\n")
						local lnum = area.s_end.row
						vim.api.nvim_buf_set_extmark(bufnr, ns_id, lnum, 0, {
							virt_lines = core.lua.list.map(output_lines, function(line)
								return {
									{
										line,
										"Function",
									},
								}
							end),
							virt_lines_above = true,
						})
						uv.fs_unlink(temp_file)
					end,
					on_error = function(_, err)
						vim.notify(string.format("Run %s failed, the error is %s", "Dart", err), vim.log.levels.ERROR, {
							title = "Task",
						})
						uv.fs_unlink(temp_file)
					end,
				})

				core.text.cancel_selection()
			end,
			mode = { "v" },
		},
	},
}
