local M = {}

table.insert(M, {
	name = "build node project",
	builder = function()
		return {
			cmd = { "pnpm" },
			args = { "build" },
			cwd = vim.fs.root(0, "package.json"),
			components = { "on_exit_set_status", "open_output" },
		}
	end,
	condition = {
		callback = function()
			return vim.fs.root(0, "package.json") ~= nil
		end,
	},
})

return M
