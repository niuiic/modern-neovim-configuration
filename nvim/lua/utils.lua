utils = { fn = {}, var = {} }

-- find project root
local getPrevLevelPath = function(currentPath)
    tmp = string.reverse(currentPath)
    _, i = string.find(tmp, "/")
    return string.sub(currentPath, 1, string.len(currentPath) - i)
end

utils.fn.getWorkspacePath = function()
    local path = vim.fn.getcwd(-1, -1)
    local pathBp = path
    while path ~= "" do
        local file, _ = io.open(path .. "/.root")
        if file ~= nil then
            return path
        else
            path = getPrevLevelPath(path)
        end
    end
    return pathBp
end

-- set keymap
utils.fn.map = vim.api.nvim_set_keymap
utils.var.opt = { noremap = true, silent = true }
local which_key = require("which-key")
utils.fn.mapRegister = which_key.register

-- set lsp keymap
utils.fn.setLspKeyMap = function(bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    require("keybinding.lsp").map(buf_set_keymap)
end

return utils
