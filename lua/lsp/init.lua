local lsp_list = {
	"cssls",
	"volar",
	"lua_ls",
	"bashls",
	"cssmodules_ls",
	"eslint",
	"html",
	"jsonls",
	"taplo",
	"stylelint_lsp",
	"wgsl_analyzer",
	"yamlls",
	"marksman",
	"lemminx",
	"glsl_analyzer",
	"tinymist",
	"dockerls",
	"somesass_ls",
	"css_variables",
	"pyright",
	"nushell",
	"rust_analyzer",
}

local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
if not vim.uv.fs_stat(root_dir .. "/package.json") or vim.uv.fs_stat(root_dir .. "/deno.json") then
	table.insert(lsp_list, "denols")
else
	table.insert(lsp_list, "vtsls")
end

-- load all lsp config
local load_lsp = function(value)
	local config = require("lsp/" .. value)

	-- set handlers
	config.handlers = config.handlers or {}
	config.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

	-- set lsp config
	require("lspconfig")[value].setup(config)
end
for _, value in ipairs(lsp_list) do
	load_lsp(value)
end

vim.cmd("hi LspInlayHint guibg=none guifg=#33FFBD")

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

local hl_list = {
	"DiagnosticVirtualTextError",
	"DiagnosticVirtualTextHint",
	"DiagnosticVirtualTextInfo",
	"DiagnosticVirtualTextWarn",
}
local function set_hl(hl)
	vim.api.nvim_set_hl(0, hl, {
		fg = vim.api.nvim_get_hl(0, {
			name = hl,
		}).fg,
	})
end
for _, hl in ipairs(hl_list) do
	set_hl(hl)
end

for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
	local default_diagnostic_handler = vim.lsp.handlers[method]
	vim.lsp.handlers[method] = function(err, result, context, config)
		if err and err.code == -32802 then
			return
		end
		return default_diagnostic_handler(err, result, context, config)
	end
end
