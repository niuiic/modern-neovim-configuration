function! coc#source#latex#init() abort
	return {
				\'triggerCharacters': ['\'],
				\'filetypes' : ['markdown'],
				\}
endfunction

function! coc#source#latex#complete(opt, cb) abort
	let items = ['kappa', 'theta', 'dot{}', 'ddot{}', 'bar{}', 'hat{}', 'exp', 'sin', 'cos', 'tan', 'sec', 'csc', 'vec{}', 'cot', 'arcsin', 'arccos', 'arctan', 'sinh', 'cosh', 'tanh', 'coth', 'sh', 'ch', 'th', 'max', 'min', 'partial', 'nabla', 'prime', 'backprime', 'infty', 'eth', 'hbar', 'sqrt{}', 'sqrt[]{}', 'pm', 'mp', 'times', 'div', 'cdot', 'odot', 'bigodot' , '{ \}', 'in', 'not', 'ni', 'cap', 'Cap', 'bigcap', 'cup', 'Cup', 'bigcup', 'subset', 'supset', 'supseteq', 'subseteq', 'subseteqq', 'supseteqq', 'subsetneq', 'supsetneq', 'supsetneqq', 'subsetneqq', 'sim', 'approx', 'leq', 'geq', 'parallel', 'nparallel', 'perp', 'angle', 'Box', 'bigtriangleup', 'bigtriangledown', 'forall', 'therefore', 'because', 'overline{}', 'Rightarrow', 'Leftarrow', 'rightarrow', 'leftarrow', 'leftrightarrow', 'nRightarrow', 'nLeftarrow', 'nleftarrow', 'nrightarrow', 'nleftrightarrow', 'overleftarrow{}', 'overrightarrow{}', 'overset{}', 'underline{}', 'sum', 'prod', 'lim', 'limits', 'int', 'iint', 'oint', 'iiint', 'frac{}{}', 'tfrac{}{}', 'dfrac{}{}', '\begin{matrix}\end{matrix}', '\begin{vmatrix}\end{vmatrix}', '\begin{bmatrix}\end{bmatrix}', '\begin{Bmatrix}\end{Bmatrix}', '\begin{pmatrix}\end{pmatrix}','\begin{cases}\end{cases}', '\begin{aligned}\end{aligned}', '\begin{array}\end{array}', 'alpha', 'psi', 'Delta', 'delta', 'beta', 'lambda', 'rho', 'varepsilon', 'Gamma', 'chi', 'mu', 'sigma', 'Lambda', 'tau', 'varphi', 'varPhi', 'phi', 'Phi', 'eta', 'omega', 'varrho', 'Pi', 'pi', 'gamma', 'xi', 'Psi', 'Sigma', 'varnothing', 'iiiint', 'bigoplus', 'circ', 'mathscr{}']
	call a:cb(items)
endfunction

