return {
	keys = {
		{
			"<space>p",
			function()
				require("code-shot").shot(function(context)
					vim.system(
						{
							"silicon",
							"--to-clipboard",
							"--pad-horiz",
							"0",
							"--pad-vert",
							"0",
							"--no-round-corner",
							"--theme",
							"Coldark-Dark",
							"--no-line-number",
							"--no-window-controls",
							context.file_path,
						},
						nil,
						function(result)
							if result.code == 0 then
								vim.notify("Shot code successfully", vim.log.levels.INFO)
							else
								vim.notify("Shot code failed", vim.log.levels.ERROR)
							end
						end
					)
				end)
			end,
			desc = "shot code",
		},
		{
			"<space>p",
			function()
				require("code-shot").shot(function(context)
					vim.fn.setreg("+", context.selection)

					vim.system(
						{
							"silicon",
							"--to-clipboard",
							"--pad-horiz",
							"0",
							"--pad-vert",
							"0",
							"--no-round-corner",
							"--theme",
							"Coldark-Dark",
							"--no-line-number",
							"--no-window-controls",
							"--from-clipboard",
							"--language",
							context.file_type,
							context.file_path,
						},
						nil,
						function(result)
							if result.code == 0 then
								vim.notify("Shot code successfully", vim.log.levels.INFO)
							else
								vim.notify("Shot code failed", vim.log.levels.ERROR)
							end
						end
					)
				end)
			end,
			desc = "shot code",
			mode = "x",
		},
	},
	branch = "dev",
}
