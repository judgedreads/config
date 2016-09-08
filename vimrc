execute pathogen#infect()
execute pathogen#helptags()
syntax on
"set background=dark
let base16colorspace=256
colorscheme base16-default-dark
"highlight Normal ctermbg=None
"highlight Search ctermfg=black
filetype plugin indent on

"to show matching brackets
set showmatch

"show line numbers
"set number
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

"normal tab complete
set wildmode=longest,list,full
set wildmenu
set wildignore+=*/__pycache__/*,*/dist/*,*/Godeps/*,*.pyc,*.pyo,*.swp,*/venv/*,*/vendor/*,*/build/*,*.egg-info/*

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

"set text width for wrapping comments with gq
set textwidth=72
"disable autowrap (still autowraps in comment blocks)
set formatoptions-=t

"use ag for searching and file listing
if executable('ag')
  set grepprg=ag\ --vimgrep\ -s
  set grepformat=%f:%l:%c:%m
  let g:ctrlp_user_command = 'cd %s && ag -l --nocolor'
  let g:ctrlp_use_caching = 0
endif

command -nargs=+ -complete=file -bar Grep silent! grep! <args>|cwindow|redraw!
nnoremap \ :Grep<SPACE>

" binding to search files for word under cursor (also sets the buffer
" search to that word for highlighting)
nnoremap <Leader>ss /<C-R><C-W><CR>:grep! -w -F
            \ "<C-R><C-W>"
            \ <CR>:cw<CR>
" regex to search files with the same extension
".*<C-R>=(expand("%:e")=="" ? "" : "\.".expand("%:e"))<CR>

let g:ctrlp_working_path_mode = 'ra'

autocmd BufWritePre <buffer> StripWhitespace

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
