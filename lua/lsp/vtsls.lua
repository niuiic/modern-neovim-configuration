require("lspconfig.configs").vtsls = require("vtsls").lspconfig

local function is_enabled()
	return require("tools.lsp_valid")("vtsls")
end

require("lsp-commands").register_command({
	name = "vtsls/rename var",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "vtsls",
		})
	end,
	is_enabled = is_enabled,
})

require("lsp-commands").register_command({
	name = "vtsls/organize imports",
	run = function()
		vim.cmd("VtsExec remove_unused_imports")
		vim.fn.timer_start(500, function()
			vim.cmd("VtsExec add_missing_imports")
		end)
	end,
	is_enabled = is_enabled,
})

require("lsp-commands").register_command({
	name = "vtsls/rename file",
	run = function()
		vim.cmd("VtsExec rename_file")
	end,
	is_enabled = is_enabled,
})

local M = {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	settings = {
		vtsls = { tsserver = { globalPlugins = {} } },
	},
	before_init = function(_, config)
		local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
		if require("omega").exist_in_file("vue", root_dir .. "/package.json") then
			local vuePluginConfig = {
				name = "@vue/typescript-plugin",
				location = os.getenv("HOME")
					.. ".local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
				languages = { "vue" },
				configNamespace = "typescript",
				enableForWorkspaceTypeScriptVersions = true,
			}
			table.insert(config.settings.vtsls.tsserver.globalPlugins, vuePluginConfig)
		end
	end,
}

return M
