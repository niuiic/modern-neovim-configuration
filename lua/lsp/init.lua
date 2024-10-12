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
}

local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
if not vim.uv.fs_stat(root_dir .. "/package.json") or vim.uv.fs_stat(root_dir .. "/deno.json") then
	table.insert(lsp_list, "denols")
else
	table.insert(lsp_list, "vtsls")
end

-- nvim-cmp support
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- load all lsp config
local load_lsp = function(value)
	local config = require("lsp/" .. value)

	-- set capabilities
	config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})

	-- set handlers
	if not config.handlers then
		config.handlers = {}
	end
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
