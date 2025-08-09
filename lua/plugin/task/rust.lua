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

local doc_process = nil

require("task").register_task({
	name = "open rust project document",
	run = function()
		if doc_process then
			vim.fn.system({ "kill", "-9", doc_process.pid })
			doc_process = nil
		end

		vim.system(
			{ "cargo", "doc" },
			{ cwd = vim.fs.root(0, "Cargo.toml") },
			vim.schedule_wrap(function(res)
				if res.code ~= 0 then
					vim.notify("failed to build doc", vim.log.levels.ERROR)
					return
				end

				local process = vim.system({ "busybox", "httpd", "-f", "-p", "7777" }, {
					cwd = vim.fs.joinpath(vim.fs.root(0, "Cargo.toml"), "target/doc"),
				})
				doc_process = process
				vim.notify("rust doc opened at http://localhost:7777", vim.log.levels.INFO)
			end)
		)
	end,
	is_enabled = function()
		return vim.fs.root(0, "Cargo.toml") ~= nil
	end,
})

vim.api.nvim_create_autocmd("VimLeave", {
	callback = function()
		if doc_process then
			vim.fn.system({ "kill", "-9", doc_process.pid })
		end
	end,
})
