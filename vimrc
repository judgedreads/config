execute pathogen#infect()
syntax on
set background=dark
let base16colorspace=256
colorscheme base16-default
highlight Search ctermfg=black
filetype plugin indent on

"tabs
"set expandtab "replace tabs with spaces
"set tabstop=4 "number of spaces to use
"set shiftwidth=4 "number of spaces used for indentation
"set softtabstop=4 " backspace treats 4 spaces as a tab
"set autoindent

"to show matching brackets
set showmatch

"show line numbers
set number
set relativenumber
highlight LineNr ctermbg=None
highlight CursorLineNr ctermbg=None
highlight SignColumn ctermbg=None

"ruler with filename and cursor position
"set laststatus=2

"have filename in titlebar
set title

"highlight search results
set hlsearch

"set text width for wrapping comments with gq
set textwidth=72
"disable autowrap (still autowraps in comment blocks)
set formatoptions-=t

"remember position of file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g`\"" | endif
endif

"allow buffer switch without saving
set hidden

"useful remaps
let mapleader = "\<Space>"
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>
nnoremap <Leader>l :lnext<CR>
nnoremap <Leader>h :lprev<CR>
nnoremap <Leader>c :noh<CR>
nnoremap <Leader>f za
nnoremap <Leader>ww :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>e :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nnoremap qq <NOP>

"tabs for make files
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.tex setlocal fo+=t tw=79

"normal tab complete
set wildmode=longest,list,full
set wildmenu
set wildignore+=*/__pycache__/*,*/dist/*,*/Godeps/*,*.pyc,*.pyo,*.swp

"git
let g:gitgutter_enabled = 0
highlight GitGutterAdd ctermbg=None ctermfg=10
highlight GitGutterChange ctermbg=None ctermfg=14
highlight GitGutterDelete ctermbg=None ctermfg=9
highlight GitGutterChangeDelete ctermbg=None ctermfg=9
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '>>'
let g:gitgutter_sign_removed = 'xx'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = '>x'
nnoremap <Leader>g :GitGutterToggle<CR>

"python
let g:pymode_options_max_line_length = 79
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}
let g:pymode_virtualenv = 0
let g:pymode_breakpoint = 0
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_run = 0
let g:pymode_breakpoint = 1
let g:pymode_lint_on_write = 1
"let g:pymode_lint_ignore = \"E501,W\"
let g:pymode_syntax_slow_sync = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_motion = 1
let g:pymode_autoPEP8_aggressive = 0
let g:pymode_autoPEP8_on_write = 1
let g:pymode_options = 1
let g:pymode_breakpoint_bind = 0
let g:pymode_run_bind = 0

" McCabe complexity set very high to avoid really annoying stuff happening in
" most previously-unchecked files.
"let g:pymode_lint_options_mccabe = {'complexity': 30}

" Use git grep if we are in a git repo, else use ag (if it were easy to
" make ag search from the project root, I would just use ag)
let output=system('git status')
if !v:shell_error
  set grepprg=git\ grep\ -n
  set grepformat=%f:%l:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep\ -s
  set grepformat=%f:%l:%c:%m
endif

" binding to search for word under cursor in files with same extension
nnoremap <Leader>ss /<C-R><C-W><CR>:grep! -w -F
            \ "<C-R><C-W>"
            \ <CR>:cw<CR>
" regex to search files with the same extension
".*<C-R>=(expand("%:e")=="" ? "" : "\.".expand("%:e"))<CR>
