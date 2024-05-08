local rust = function(file_path)
	return {
		{
			cmd = "rustfmt",
			args = {
				"--edition=2021",
				"--config",
				"imports_granularity=Crate,group_imports=StdExternalCrate",
				file_path,
			},
		},
	}
end

local xml = function(file_path)
	return {
		{
			cmd = "xmlformat",
			args = {
				"--overwrite",
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
			svg = xml,
		},
	})
end

local lsp_format_langs = {
	"wgsl",
	"glsl",
}

return {
	config = config,
	keys = {
		{
			"<C-f>",
			function()
				local core = require("core")
				if
					core.lua.list.includes(lsp_format_langs, function(lang)
						return lang == vim.bo.filetype
					end)
				then
					vim.lsp.buf.format()
				else
					require("format").format()
				end
			end,
			desc = "format",
			silent = true,
		},
		{
			"<C-f>",
			function()
				require("format").format_range()
			end,
			desc = "format",
			silent = true,
			mode = "v",
		},
	},
}
