local dap_utils = require("dap-utils")

---@diagnostic disable-next-line: missing-fields
require("dap-vscode-js").setup({
	debugger_cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/js-debug-adapter" },
})

local function set_adapter(adapter)
	require("dap").adapters[adapter] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "node",
			args = {
				os.getenv("HOME")
					.. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
				"${port}",
			},
		},
	}
end
local adapters = { "pwa-node", "pwa-chrome" }
for _, adapter in ipairs(adapters) do
	set_adapter(adapter)
end

local get_node = function()
	local cwd = vim.fs.root(0, "package.json") or vim.fn.getcwd()

	return {
		{
			name = "Launch project",
			type = "pwa-node",
			request = "launch",
			cwd = cwd,
			runtimeExecutable = "pnpm",
			runtimeArgs = { "debug" },
		},
		{
			name = "Launch file",
			type = "pwa-node",
			request = "launch",
			program = "${file}",
			cwd = cwd,
		},
		{
			name = "Attach",
			type = "pwa-node",
			request = "attach",
			port = 9229,
			cwd = cwd,
		},
		{
			name = "Attach process",
			type = "pwa-node",
			request = "attach",
			processId = require("dap.utils").pick_process,
			cwd = cwd,
		},
	}
end

local get_deno = function()
	local cwd = vim.fs.root(0, "package.json") or vim.fn.getcwd()

	return {
		name = "Deno",
		type = "pwa-node",
		request = "launch",
		program = "${file}",
		runtimeExecutable = "deno",
		runtimeArgs = {
			"--inspect-wait",
		},
		cwd = cwd,
		attachSimplePort = 9229,
	}
end

local get_browser = function()
	local cwd = vim.fs.root(0, "package.json") or vim.fn.getcwd()

	return {
		{
			name = "Launch Chrome",
			type = "pwa-chrome",
			request = "launch",
			runtimeExecutable = "/usr/bin/google-chrome-stable",
			userDataDir = false,
			webRoot = cwd,
		},
		{
			name = "attach chrome",
			type = "pwa-chrome",
			request = "attach",
			port = 9222,
			webroot = cwd,
		},
	}
end

local function is_vue_project()
	return require("omega").exist_in_file("vue", (vim.fs.root(0, ".git") or vim.fn.getcwd()) .. "/package.json")
end

local function is_deno_project()
	local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
	return not vim.uv.fs_stat(root_dir .. "/package.json") or vim.uv.fs_stat(root_dir .. "/deno.json")
end

dap_utils.setup({
	typescript = function(run)
		if is_deno_project() then
			run(get_deno())
		elseif is_vue_project() then
			run(vim.list_extend(get_browser(), get_node()))
		else
			run(get_node())
		end
	end,
	javascript = function(run)
		if is_deno_project() then
			run(get_deno())
		elseif is_vue_project() then
			run(vim.list_extend(get_browser(), get_node()))
		else
			run(get_node())
		end
	end,
	javascriptreact = function(run)
		run(get_browser())
	end,
	typescriptreact = function(run)
		run(get_browser())
	end,
	vue = function(run)
		run(get_browser())
	end,
})
