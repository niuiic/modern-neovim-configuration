local status, surround = pcall(require, "surround")
if not status then
	vim.notify("not found surround.nvim")
	return
end

surround.setup({
	context_offset = 100,
	load_autogroups = false,
	mappings_style = "surround",
	map_insert_mode = true,
	quotes = { "'", '"' },
	brackets = { "(", "{", "[" },
	space_on_closing_char = false,
	pairs = {
		nestable = { b = { "(", ")" }, s = { "[", "]" }, B = { "{", "}" }, a = { "<", ">" } },
		linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' } },
	},
	prefix = "s",
})

-- ds<char>
-- cs<from><to>
-- ys{motion}{char}
