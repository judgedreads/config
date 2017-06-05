call plug#begin('~/.vim/bundle')
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'hynek/vim-python-pep8-indent'
Plug 'IN3D/vim-raml'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rust-lang/rust.vim'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
call plug#end()

colorscheme base16-monokai

"to show matching brackets
set showmatch

"show line numbers
"set number
set relativenumber
highlight LineNr ctermbg=None
highlight CursorLineNr ctermbg=None
highlight SignColumn ctermbg=None
highlight Todo cterm=bold, ctermbg=None

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
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nnoremap qq <NOP>
"paste over selection without yanking
vnoremap p "_dP
vnoremap c "_c
nnoremap c "_c


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

"use rg/ag for searching and file listing
if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep\ -s
  set grepformat=%f:%l:%c:%m
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


" autocmd BufWritePre <buffer> StripWhitespace

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['frosted', 'pycodestyle']
let g:syntastic_python_pycodestyle_args = '--ignore="E501"'
let g:syntastic_go_checkers = ['govet', 'gofmt', 'gotype']
let g:syntastic_rust_checkers = ['rustc']

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen()
  let fname = Chomp(system("ag -l | dmenu -i -l 20 -p 'edit' -fn sans:size=8"))
  if empty(fname)
    return
  endif
  execute "e" . " " . fname
endfunction

"File finding
nnoremap <Leader>e :FZF<CR>
" nnoremap <Leader>e :call DmenuOpen()<CR>
nnoremap <leader>b :call fzf#run({'source': map(range(1, bufnr('$')), 'bufname(v:val)'), 'sink': 'e', 'down': '30%'})<CR>
