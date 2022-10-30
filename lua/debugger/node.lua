local utils = require("utils")

utils.fn.require("dap-vscode-js").setup({
	debugger_path = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter",
})

for _, language in ipairs({ "typescript", "javascript" }) do
	utils.fn.require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = utils.fn.require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end
