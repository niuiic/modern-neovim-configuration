local rust = function(file_path)
	return {
		{
			cmd = "rustfmt",
			args = {
				"--edition=2021",
				file_path,
			},
		},
	}
end

local config = function()
	require("format").setup({
		allow_update_if_buf_changed = true,
		filetypes = {
			rust = rust,
		},
	})
end

return {
	config = config,
	keys = {
		{
			"<C-f>",
			function()
				require("format").format()
			end,
			desc = "format",
			silent = true,
		},
	},
}
