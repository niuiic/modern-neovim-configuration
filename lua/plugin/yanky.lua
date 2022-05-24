require("yanky").setup({
    ring = {
        history_length = 10,
        storage = "shada",
        sync_with_numbered_registers = true,
    },
    picker = {
        select = {
            action = nil,
        },
    },
    system_clipboard = {
        sync_with_ring = false,
    },
    highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
    },
    preserve_cursor_position = {
        enabled = true,
    },
})
