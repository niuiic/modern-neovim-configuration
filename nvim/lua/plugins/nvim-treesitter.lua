local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("not found nvim-treesitter")
    return
end

treesitter.setup({
    -- use :TSInstallInfo to check pasers
    ensure_installed = {
        "bash", "c", "cmake", "cpp", "css", "go", "gomod", "html", "javascript",
        "json", "lua", "make", "markdown", "ninja", "python", "rust", "scss",
        "toml", "todotxt", "tsx", "typescript", "verilog", "vim", "vue", "yaml"
    },
    highlight = {enable = true, additional_vim_regex_highlighting = false},
    intent = {enable = true}
})
