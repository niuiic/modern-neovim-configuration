require("lsp-commands").register_command({
	name = "denols/rename var",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "denols",
		})
	end,
	is_enabled = function()
		return require("tools.lsp_valid")("denols")
	end,
})

require("lsp-commands").register_command({
	name = "denols/organize imports",
	run = function()
		local diagnostic_list = vim.diagnostic.get()
		local diagnostic = vim.iter(diagnostic_list):find(function(diagnostic)
			return diagnostic.source == "deno-ts"
		end)
		if diagnostic == nil then
			return
		end
		local cur_pos = vim.api.nvim_win_get_cursor(0)
		vim.api.nvim_win_set_cursor(0, {
			diagnostic.lnum + 1,
			diagnostic.col,
		})
		vim.lsp.buf.code_action({
			apply = true,
			filter = function(action)
				return action.title == "Add all missing imports"
			end,
		})
		vim.api.nvim_win_set_cursor(0, cur_pos)
	end,
	is_enabled = function()
		return require("tools.lsp_valid")("denols")
	end,
})

return {
	root_dir = function()
		return vim.fs.root(0, "deno.json") or vim.fn.getcwd()
	end,
	on_attach = function()
		vim.g.markdown_fenced_languages = {
			"ts=typescript",
		}

		local function virtual_text_document(params)
			local bufnr = params.buf
			local actual_path = params.match:sub(1)

			local clients = vim.lsp.get_clients({ name = "denols" })
			if #clients == 0 then
				vim.notify("cannot find denols", vim.log.levels.WARN)
				return
			end

			local client = clients[1]
			local method = "deno/virtualTextDocument"
			local req_params = { textDocument = { uri = actual_path } }
			local response = client:request_sync(method, req_params, 2000, 0)
			if not response or type(response.result) ~= "string" then
				vim.notify("failed to get virtual document's content", vim.log.levels.WARN)
				return
			end

			local lines = vim.split(response.result, "\n")
			vim.api.nvim_set_option_value("readonly", false, { buf = bufnr })
			vim.api.nvim_set_option_value("modifiable", true, { buf = bufnr })
			vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
			vim.api.nvim_set_option_value("readonly", true, { buf = bufnr })
			vim.api.nvim_set_option_value("modified", false, { buf = bufnr })
			vim.api.nvim_set_option_value("modifiable", false, { buf = bufnr })
			vim.api.nvim_buf_set_name(bufnr, actual_path)
			vim.lsp.buf_attach_client(bufnr, client.id)

			local filetype = "typescript"
			if actual_path:sub(-3) == ".md" then
				filetype = "markdown"
			end
			vim.api.nvim_set_option_value("filetype", filetype, { buf = bufnr })
		end

		vim.api.nvim_create_autocmd({ "BufReadCmd" }, {
			pattern = { "deno:/*", "asset://*" },
			callback = virtual_text_document,
		})
	end,
}
