return function()
	vim.lsp.buf.code_action({
		apply = true,
		filter = function(action)
			return string.find(action.title, "Convert parameters to destructured object") ~= nil
		end,
	})
end
