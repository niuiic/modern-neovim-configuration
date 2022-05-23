local cmp = require("cmp")
local luasnip = require("luasnip")

local function jump(dir)
    if luasnip.jumpable(dir) then
        luasnip.jump(dir)
    end
end

local function expand_or_jump()
    if luasnip.expand_or_jumpable() then
        return luasnip.expand_or_jump()
    end
end

cmp.setup({
    mapping = {
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    },
})
