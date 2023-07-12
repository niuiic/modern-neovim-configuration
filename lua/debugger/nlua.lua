local dap = require("dap")
local dap_utils = require("dap-utils")

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end

dap_utils.setup({
	lua = function(run)
		run({
			type = "nlua",
			request = "attach",
			name = "Attach to running Neovim instance",
		})
	end,
})
