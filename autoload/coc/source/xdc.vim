function! coc#source#xdc#init() abort
    return {
        \'triggerCharacters': [''],
        \'filetypes' : ['xdc'],
        \}
endfunction

function! coc#source#xdc#complete(opt, cb) abort
    let items = ['set_property', 'create_clock', 'period', 'waveform', 'IOSTANDARD', 'LVCMOS33', 'PACKAGE_PIN', 'PULLDOWN', 'true', 'false', 'dict' ]
    call a:cb(items)
endfunction
