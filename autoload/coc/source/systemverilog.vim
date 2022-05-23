function! coc#source#systemverilog#init() abort
    return {
        \'triggerCharacters': [''],
        \'filetypes' : ['systemverilog'],
        \}
endfunction

function! coc#source#systemverilog#complete(opt, cb) abort
    let items = ['reg', 'wire', 'forever', 'posedge', 'negedge', 'module', 'endmodule', 'initial', 'input', 'output', 'parameter', 'assign', 'integer', 'shortint', 'int', 'longint', 'unsigned', 'signed', 'string', 'logic', 'break', 'continue']
    call a:cb(items)
endfunction
