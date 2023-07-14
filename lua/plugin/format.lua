local rust = function(file_path)
	return {
		{
			cmd = "rustfmt",
			args = {
				"--edition=2021",
				file_path,
			},
			ignore_err = function(err, data)
				return err == nil and data == nil
			end,
		},
	}
end

local vue = function(file_path)
	local config = {
		{
			cmd = "pnpm",
			args = { "eslint", "--fix", file_path },
			ignore_err = function()
				return true
			end,
		},
		{
			cmd = "pnpm",
			args = { "stylelint", "--fix", file_path },
			ignore_err = function()
				return true
			end,
		},
		{
			cmd = "prettier",
			args = {
				"-w",
				file_path,
			},
			ignore_err = function(err, data)
				return err == nil and data == nil
			end,
			on_success = function()
				vim.cmd("RefreshDivider")
				vim.notify("Formatting Succeed", vim.log.levels.INFO, {
					title = "Format",
				})
			end,
		},
	}
	local diagnostic = vim.diagnostic.get(0)
	if not diagnostic or #diagnostic == 0 then
		return { config[1] }
	end
	return config
end

local config = function()
	require("format").setup({
		allow_update_if_buf_changed = true,
		filetypes = {
			rust = rust,
			vue = vue,
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
