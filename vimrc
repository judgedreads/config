execute pathogen#infect()
syntax on
set background=dark
let base16colorspace=256
colorscheme base16-default
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

"tabs for make files
autocmd FileType make setlocal noexpandtab

"normal tab complete
set wildmode=longest,list,full
set wildmenu
set wildignore+=*/__pycache__/*,*/dist/*,*/Godeps/*,*.pyc,*.pyo,*.swp

"git
let g:gitgutter_enabled = 0
nnoremap <Leader>g :GitGutterToggle<CR>

"python
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
