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

table.insert(M, {
	name = "build rust project",
	builder = function()
		return {
			cmd = { "cargo" },
			args = { "build" },
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

table.insert(M, {
	name = "test rust project",
	builder = function()
		return {
			cmd = { "cargo" },
			args = { "nextest", "run" },
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
