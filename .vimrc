" PLUGINS
call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'fatih/vim-go'
	Plug 'easymotion/vim-easymotion'
	Plug 'vim-airline/vim-airline'
	Plug 'scrooloose/nerdcommenter'
	Plug 'JamshedVesuna/vim-markdown-preview'
	Plug 'airblade/vim-gitgutter'
	Plug 'Shougo/deoplete.nvim'
	Plug 'zchee/deoplete-go', { 'do': 'make'}
	Plug 'rakr/vim-one'
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'majutsushi/tagbar'
	Plug 'w0rp/ale'
	Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
call plug#end()

" BASIC SETTINGS
language en_US
filetype on

syntax enable
syntax on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
colorscheme one
"colorscheme PaperColor

set ignorecase
set smartcase

set termguicolors
set nopaste
set noshowmode
set noswapfile
set nohlsearch
set number
set ignorecase
set smartcase
set relativenumber
set splitright
set completeopt="menu"
set laststatus=2

set numberwidth=1

" Set leader key
let mapleader=","

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" Move quickfix window to bottom of window layout
autocmd FileType qf wincmd J

nmap j gj
nmap k gk

set guifont=Source\ Code\ Powerline\ Medium:h14

if has("statusline")
	set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPACES & TABS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GO
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:syntastic_aggregate_errors = 1

let g:go_auto_sameids = 0

let g:go_fmt_command = "goimports"

let g:go_list_type = "quickfix"

"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_metalinter_command = ""
let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_metalinter_path = "./..."

let g:go_metalinter_enabled = ['vet', 'golint', 'deadcode', 'errcheck']

" Function signature in status bar
"let g:go_auto_type_info = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GO KEYBINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType go nmap <Leader>l <Plug>(go-metalinter)

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

autocmd FileType go nmap <leader>t  <Plug>(go-test)

autocmd FileType go nmap <C-\> :GoDecls<CR>
autocmd FileType go nmap <Leader>w :GoAlternate<CR>
" Conflicted with FZF <Leader>f
"autocmd FileType go nmap <Leader>f :GoRename
autocmd FileType go nmap <Leader>e :GoErrCheck<CR>

autocmd FileType go nmap <Leader>q <Plug>(go-info)
autocmd FileType go nmap <Leader>d <Plug>(go-doc)

" Jump between errors in quickfix list
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EASY MOTION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCOMMENTER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDCompactSexyComs = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM MARKDOWN PREVIEW
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GITGUTTER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set signcolumn=yes


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AIRLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='one'
"let g:airline_theme='papercolor'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DEOPLETE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/local/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'go': ['golint'],
\}

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

function! LinterStatus() abort
	let l:counts = ale#statusline#Count(bufnr(''))

	let l:all_errors = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors

	return l:counts.total == 0 ? 'OK' : printf(
	\   '%dW %dE',
	\   all_non_errors,
	\   all_errors
	\)
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAGBAR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
