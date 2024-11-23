require("task").register_task({
	name = "launch rust project",
	run = function()
		require("plugin.task.utils").run_in_term({
			"cd " .. vim.fs.root(0, "Cargo.toml"),
			"cargo run",
		})
	end,
	is_enabled = function()
		return vim.fs.root(0, "Cargo.toml") ~= nil
	end,
})

require("task").register_task({
	name = "build rust project",
	run = function()
		require("plugin.task.utils").run_in_term({
			"cd " .. vim.fs.root(0, "Cargo.toml"),
			"cargo build --release",
		})
	end,
	is_enabled = function()
		return vim.fs.root(0, "Cargo.toml") ~= nil
	end,
})

require("task").register_task({
	name = "test rust project",
	run = function()
		require("plugin.task.utils").run_in_term({
			"cd " .. vim.fs.root(0, "Cargo.toml"),
			"cargo nextest run --no-capture",
		})
	end,
	is_enabled = function()
		return vim.fs.root(0, "Cargo.toml") ~= nil
	end,
})

require("task").register_task({
	name = "open rust project document",
	run = function()
		vim.system({ "cargo", "doc", "--open" }, {
			cwd = vim.fs.root(0, "Cargo.toml"),
		})
	end,
	is_enabled = function()
		return vim.fs.root(0, "Cargo.toml") ~= nil
	end,
})
