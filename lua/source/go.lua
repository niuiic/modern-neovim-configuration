local source = {}
local cmp = require("cmp")

function source:complete(_, callback)
    callback({
        { label = "package" },
    })
end

cmp.register_source("go", source)

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
    pattern = { "*.go" },
    callback = function()
        cmp.setup.buffer({
            sources = {
                { name = "go" },
            },
        })
    end,
})
