local utils = require("utils")

local lspList = {
	"cssls",
	"volar",
	"sumneko_lua",
	"gopls",
	"bashls",
	"cssmodules_ls",
	"eslint",
	"html",
	"jsonls",
	"rust_analyzer",
	"sqls",
	"clangd",
	"taplo",
	"verible",
	"stylelint_lsp",
	"pyright",
	"tsserver",
	"wgsl_analyzer",
	"yamlls",
	"marksman",
	"dotls",
	"lemminx",
	"texlab",
}

-- common lsp config
local on_attach = function(client, _)
	-- disable default format feature of lsp
	client.server_capabilities.documentFormattingProvider = false
end

-- nvim-cmp support
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_commands = {}

local function set_lsp_commands(lsp, commands)
	local lsp_upper = string.upper(string.sub(lsp, 1, 1)) .. string.sub(lsp, 2)
	for key, _ in pairs(commands) do
		if string.find(key, lsp_upper) ~= nil then
			local name = string.sub(key, string.len(lsp_upper) + 1)
			if lsp_commands[name] == nil then
				lsp_commands[name] = {}
			end
			table.insert(lsp_commands[name], lsp)
		end
	end
end

-- load all lsp config
for _, value in pairs(lspList) do
	local config = require("lsp/" .. value)

	-- set on_attach
	if config.on_attach == nil then
		config.on_attach = on_attach
	else
		local on_attach_from_config = config.on_attach
		config.on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			on_attach_from_config(client, bufnr)
		end
	end

	-- set capabilities
	if value ~= "taplo" then
		if config.modify_capabilities == nil then
			config.capabilities = capabilities
		else
			config.capabilities = config.modify_capabilities(utils.fn.deep_clone(capabilities))
		end
	end

	-- set lsp config
	require("lspconfig")[value].setup(config)

	-- set commands
	local commands = utils.fn.merge_object(require("lspconfig")[value].commands, config.commands)
	if commands ~= nil then
		set_lsp_commands(value, commands)
	end
end

for command, lsps in pairs(lsp_commands) do
	vim.api.nvim_create_user_command("LSP" .. command, function()
		local active_clients = {}
		for _, client in pairs(vim.lsp.get_active_clients()) do
			active_clients[client.name] = {}
		end
		local new_lsp_list = {}
		for _, value in pairs(lsps) do
			if active_clients[value] ~= nil then
				table.insert(new_lsp_list, value)
			end
		end
		if #new_lsp_list == 0 then
			vim.notify("no active lsp client supports this command", "warn")
			return
		elseif #new_lsp_list == 1 then
			local lsp_upper = string.upper(string.sub(new_lsp_list[1], 1, 1)) .. string.sub(new_lsp_list[1], 2)
			vim.notify(lsp_upper .. " is working", vim.log.levels.INFO)
			vim.cmd(lsp_upper .. command)
		else
			vim.ui.select(new_lsp_list, { prompt = "select specific lsp" }, function(choice)
				local lsp_upper = string.upper(string.sub(choice, 1, 1)) .. string.sub(choice, 2)
				vim.notify(lsp_upper .. " is working", vim.log.levels.INFO)
				vim.cmd(lsp_upper .. command)
			end)
		end
	end, {})
end

local function rename_filter(client)
	if utils.fn.match_str_in_file(utils.fn.root_pattern() .. "/package.json", "vue") then
		if client.name == "volar" then
			return true
		end
		return false
	else
		return true
	end
end

local function copy_file_path()
	local name = vim.api.nvim_buf_get_name(0)
	local root_path = utils.fn.root_pattern()
	local index = string.find(name, root_path)
	if index == nil then
		vim.notify("The file is not under the project", vim.log.levels.ERROR)
	else
		local str = string.sub(name, string.len(root_path) + 2)
		vim.fn.setreg("+", str)
		vim.notify("Copied " .. str .. " to clipboard", vim.log.levels.INFO)
	end
end

require("which-key").register({
	l = {
		name = "lsp commands",
		f = {
			"<cmd>LSPRenameFile<CR>",
			"rename file",
		},
		p = {
			function()
				copy_file_path()
			end,
			"copy path",
		},
		r = {
			function()
				vim.lsp.buf.rename(nil, {
					filter = rename_filter,
				})
			end,
			"rename vars",
		},
		i = {
			"<cmd>LSPOrganizeImports<CR>",
			"organize imports",
		},
		F = {
			"<cmd>LSPFixAll<CR>",
			"fix all",
		},
		R = {
			"<cmd>LspRestart *<CR>",
			"restart all lsp",
		},
		a = {
			"<cmd>CodeActionMenu<CR>",
			"code action",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

vim.diagnostic.config({
	float = { border = "single" },
})

require("lspconfig.ui.windows").default_options = {
	border = "single",
}
