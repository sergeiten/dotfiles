set nocompatible              " be iMproved, required
filetype plugin on            " required

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'google/vim-colorscheme-primary'

call plug#end()


" Set leader key
let mapleader=","


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'wr'
let g:ctrlp_buftag_types = {
    \'php': '--php-kinds=icdf'
\}

set wildignore+=*/vendor/**



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1

map <C-?> <plug>NERDCommenterComment
map <C-_> <plug>NERDCommenterToggle



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a

set tags+=tags,tags.vendors

" quick save
nmap <leader>w :w<CR>

" quick quit
nmap <leader>q :q<CR>

" jj is escape
inoremap jj <esc>

set autoread
set rnu

set encoding=utf-8
set termencoding=utf-8

set noswapfile

set hidden

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Make sure that coursor is always vertically centered on j/k moves
set so=999

" Copy to OS clipboard
vmap <leader>c "+y



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set t_Co=256
set background=dark

colorscheme primary



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPACES & TABS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
filetype plugin on
filetype plugin indent on

set number
set showcmd
set wildmenu
set lazyredraw
set showmatch
set laststatus=2
set linespace=3
set guifont=Fira\ Code:h14

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nohlsearch
set incsearch
set ignorecase




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOVEMENT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap j gj
nnoremap k gk

" switching between buffers
nnoremap <Leader>e :bnext<cr>
"nnoremap <Leader> :bprevious<cr>

" jumping blocks
"nmap <s-j> <s-}>
"nmap <s-k> <s-{>

" jumping between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
