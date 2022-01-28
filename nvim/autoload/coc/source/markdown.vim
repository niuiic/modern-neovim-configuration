function! coc#source#markdown#init() abort
	return {
				\'triggerCharacters': ['\'],
				\'filetypes' : ['markdown'],
				\}
endfunction

function! coc#source#latex#complete(opt, cb) abort
	let items = ['```html```', '```css```', '```typescript```', '```javascript```']
	call a:cb(items)
endfunction

