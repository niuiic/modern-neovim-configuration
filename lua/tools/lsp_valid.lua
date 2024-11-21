return function(lsp)
	local client = vim.lsp.get_clients({
		name = lsp,
	})[1]

	if not client then
		return false
	end

	if not client.attached_buffers[vim.api.nvim_get_current_buf()] then
		return false
	end

	return true
end
