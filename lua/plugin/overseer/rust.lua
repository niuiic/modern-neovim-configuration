local M = {}

table.insert(M, {
	name = "launch rust project",
	builder = function()
		return {
			cmd = { "cargo" },
			args = { "run" },
			cwd = vim.fs.root(0, "Cargo.toml"),
			components = { "on_exit_set_status", "open_output" },
		}
	end,
	condition = {
		callback = function()
			return vim.fs.root(0, "Cargo.toml") ~= nil
		end,
	},
})

return M
