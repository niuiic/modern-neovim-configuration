vim.cmd([[
    syn match QuickFixWarn /warn/
    syn match QuickFixWarn /Warn/
    syn match QuickFixWarn /warning/
    syn match QuickFixWarn /WARN/
    syn match QuickFixWarn /WARNING/
    syn match QuickFixErr /error/
    syn match QuickFixErr /Error/
    syn match QuickFixErr /ERROR/
    syn match QuickFixNote /note/
    syn match QuickFixNote /Note/
    syn match QuickFixNote /NOTE/
    hi def link     QuickFixErr         Function
    hi def link     QuickFixWarn         Function
    hi def link     QuickFixNote         Function
    hi QuickFixErr guifg=red
    hi QuickFixWarn guifg=yellow
    hi QuickFixNote guifg=green
]])
