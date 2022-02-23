function! coc#source#markdown#init() abort
	return {
				\'triggerCharacters': [''],
				\'filetypes' : ['markdown'],
				\}
endfunction

function! coc#source#markdown#complete(opt, cb) abort
	let items = ['```html```', '```css```', '```typescript```', '```javascript```', '```scss```', '```go```']
	call a:cb(items)
endfunction
