local dap_utils = require("dap-utils")

-- adapter from korri123/bun-dap-x, talks DAP over stdio to Bun's inspector.
-- bunx is run from the project dir (not the source dir) so it resolves the
-- project's own copy first, then caches the npm package under ~/.bun.
require("dap").adapters["bun-dap-x"] = {
	type = "executable",
	command = "bunx",
	args = { "bun-dap-x" },
	cwd = function()
		return vim.fs.root(0, "package.json") or vim.fn.getcwd()
	end,
}

local function is_bun_project()
	return require("omega").exist_in_file("bun", (vim.fs.root(0, ".git") or vim.fn.getcwd()) .. "/package.json")
end

local function get_bun()
	local cwd = vim.fs.root(0, "package.json") or vim.fn.getcwd()

	return {
		{
			name = "Bun: Launch file",
			type = "bun-dap-x",
			request = "launch",
			program = "${file}",
			cwd = cwd,
			runtime = "bun",
		},
		{
			name = "Bun: Launch file with args",
			type = "bun-dap-x",
			request = "launch",
			program = "${file}",
			cwd = cwd,
			runtime = "bun",
			args = function()
				return vim.split(vim.fn.input("Args: "), " ", { trimempty = true })
			end,
		},
		{
			name = "Bun: Test file",
			type = "bun-dap-x",
			request = "launch",
			program = "${file}",
			cwd = cwd,
			runtime = "bun",
			runtimeArgs = { "test" },
		},
		{
			-- `bun --inspect=<host>:<port> <file>` prints ws://host:port/<id>; paste it
			name = "Bun: Attach to inspector",
			type = "bun-dap-x",
			request = "attach",
			url = function()
				return vim.fn.input("Inspector ws url: ", "ws://127.0.0.1:6499/", "file")
			end,
		},
	}
end

local function bun_js(run)
	if is_bun_project() then
		run(get_bun())
	else
		run(require("debugger/js").get_configs(vim.bo.filetype))
	end
end

dap_utils.setup({
	typescript = bun_js,
	javascript = bun_js,
	typescriptreact = bun_js,
	javascriptreact = bun_js,
	vue = bun_js,
})
