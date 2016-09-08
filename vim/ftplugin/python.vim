"tabs
setlocal expandtab "replace tabs with spaces
setlocal tabstop=4 "number of spaces to use
setlocal shiftwidth=4 "number of spaces used for indentation
setlocal softtabstop=4 " backspace treats 4 spaces as a tab
setlocal autoindent
setlocal nosmartindent

"folding
setlocal foldmethod=indent
setlocal foldlevel=99

"format code on write
autocmd BufWritePre <buffer> Autopep8
let g:autopep8_ignore="E501"
let g:autopep8_disable_show_diff=1

"lint code after write
autocmd BufWritePost <buffer> call Flake8()

let python_highlight_all=1

"python-mode
"let g:pymode_virtualenv = 0
"let g:pymode_breakpoint = 0
"let g:pymode_folding = 0
"let g:pymode_rope = 0
"let g:pymode_options_colorcolumn = 0
"let g:pymode_run = 0
"let g:pymode_breakpoint = 1
"let g:pymode_lint_on_write = 1
"let g:pymode_lint_ignore = \"E501,W\"
"let g:pymode_syntax_slow_sync = 0
"let g:pymode_trim_whitespaces = 1
"let g:pymode_motion = 1
"let g:pymode_autoPEP8_aggressive = 0
"let g:pymode_autoPEP8_on_write = 1
"let g:pymode_options = 1
"let g:pymode_breakpoint_bind = 0
"let g:pymode_run_bind = 0
"let g:pymode_lint_options_mccabe = {'complexity': 30}
