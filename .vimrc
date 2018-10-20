" PLUGINS
call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'fatih/vim-go'
	Plug 'easymotion/vim-easymotion'
	Plug 'scrooloose/nerdcommenter'
	Plug 'JamshedVesuna/vim-markdown-preview'
	Plug 'airblade/vim-gitgutter'
	Plug 'Shougo/deoplete.nvim'
	Plug 'zchee/deoplete-go', { 'do': 'make'}
	Plug 'itchyny/lightline.vim'
	Plug 'christoomey/vim-tmux-navigator'
	Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'w0rp/ale'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'jiangmiao/auto-pairs'

	" Colorschemes
	Plug 'sonph/onehalf', {'rtp': 'vim/'}
call plug#end()

let g:python2_host_prog = '/usr/local/bin/python2.7'
let g:python3_host_prog = '/usr/local/bin/python3'

let $NVIM_TUI_ENABLE_TRUE_COLOR=1


" BASIC SETTINGS
language en_US
filetype on

syntax enable
syntax on

colorscheme onehalfdark
set background=dark

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

" Movements
nnoremap <C-j> 10j
nnoremap <C-k> 10k

" Copy to clipboard
set clipboard=unnamed
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" Move quickfix window to bottom of window layout
autocmd FileType qf wincmd J

autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType vue :setlocal sw=2 ts=2 sts=2


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
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_types = 1

"let g:go_auto_sameids = 0
let g:go_fmt_command = "goimports"
"let g:go_list_type = "quickfix"

"let g:go_metalinter_autosave = 0
"let g:go_metalinter_command = ""
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_path = "./..."
"let g:go_metalinter_autosave_enabled = ['vet', 'golint']
"let g:go_fmt_fail_silently = 1

" Function signature in status bar
"let g:go_auto_type_info = 1

au FileType go nmap <F9> :GoCoverageToggle -short<cr>


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
map <C-]> :cnext<CR>
map <C-[> :cprevious<CR>
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
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'


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
" DEOPLETE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LIGHTLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
\ 'colorscheme': 'onehalfdark',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['charvaluehex', 'fileformat', 'fileencoding', 'filetype']]
\ },
\ 'component': {
\   'charvaluehex': '0x%B'
\ },
\ }

let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {'go': ['gometalinter']}
let g:ale_go_gometalinter_options = '--fast'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['vue'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
"let g:ale_lint_delay = '5s'
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

