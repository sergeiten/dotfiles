call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'fatih/vim-go'
	Plug 'easymotion/vim-easymotion'
	Plug 'scrooloose/nerdcommenter'
	"Plug 'airblade/vim-gitgutter'
	Plug 'itchyny/lightline.vim'
	Plug 'christoomey/vim-tmux-navigator'
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	"Plug 'jiangmiao/auto-pairs'
	"Plug 'rust-lang/rust.vim'
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
	Plug 'pangloss/vim-javascript'
	Plug 'mxw/vim-jsx'
    Plug 'tomlion/vim-solidity'
    Plug 'HerringtonDarkholme/yats.vim'

	" Colorschemes
	Plug 'phanviet/vim-monokai-pro'
    Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

if has("gui_running")
    set guifont=Fira\ Code:h12
    set guifont=SourceCodePro-Light:h13
else
    set t_Co=256
    set term=screen-256color
endif

imap <Tab> <C-P>

" BASIC SETTINGS
language en_US
filetype plugin indent on
set omnifunc=csscomplete#CompleteCSS

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

syntax enable
syntax on

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 
set background=dark
colorscheme dracula

set ignorecase
set smartcase
set hidden
set cmdheight=2
set updatetime=300
set signcolumn=yes
" don't give |ins-completion-menu| messages.
set shortmess+=c

set termguicolors
set nopaste
set noshowmode
set noswapfile
set nohlsearch
set number
set ignorecase
set smartcase
set relativenumber
set splitbelow
set completeopt-=preview
set laststatus=2
set numberwidth=1
set fileencoding=utf-8
set encoding=utf-8
set autoread
" remove scrollbars
set guioptions=

" Set leader key
let mapleader=","

" Copy to clipboard
set clipboard=unnamed
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" Move quickfix window to bottom of window layout
autocmd FileType qf wincmd J


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPACES & TABS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

autocmd FileType javascript setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType javascript.jsx setlocal sw=2 ts=2 sts=0 expandtab
autocmd FileType json setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType css setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType scss setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType html setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType vue setlocal sw=2 ts=2 sts=2 expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-GO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

let g:go_code_completion_enabled = 0
let g:go_auto_type_info = 0
let g:go_fmt_autosave = 1
let g:go_mod_fmt_autosave = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_decls_mode = 'fzf'
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

au FileType go nmap <F9> :GoCoverageToggle -short<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GO KEYBINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au FileType go nmap <Leader>l <Plug>(go-metalinter)

" autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

autocmd FileType go nmap <C-\> :GoDecls<CR>
" autocmd FileType go nmap <Leader>w :GoAlternate<CR>

autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>d <Plug>(go-doc)

" Jump between errors in quickfix list
map <C-]> :cnext<CR>
map <C-[> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
" autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
" autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')



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
" DEOPLETE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Skip the check of neovim module
"let g:python3_host_skip_check = 1

"let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" let g:deoplete#sources#go#use_cache = 1
" let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'

" deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LIGHTLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
\ 'active': {
\   'left': [['mode', 'paste'], ['cocstatus'], ['filename', 'modified'], ['cocgitstatus']],
\   'right': [['lineinfo'], ['charvaluehex', 'fileformat', 'fileencoding', 'filetype']]
\ },
\ 'component': {
\   'charvaluehex': '0x%B',
\ },
\ 'component_function': {
\	'cocstatus': 'coc#status'
\ },
\ 'component_expand': {
\   'cocgitstatus': 'LightLineCocGitStatus'
\ }
\}

function! LightLineCocGitStatus()
  let gstatus = get(g:, 'coc_git_status')
  let bstatus = get(b:, 'coc_git_status', {})
  if empty(gstatus)
    return ''
  endif
  return gstatus . ' ' . bstatus
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE (DISABLED)
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
" Display hidden files
let NERDTreeShowHidden=1

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()

" use <enter> to confirm complete<Plug>_
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"<Paste>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[v` and `]v` to navigate diagnostics
nmap <silent> [v <Plug>(coc-diagnostic-prev)
nmap <silent> ]v <Plug>(coc-diagnostic-next)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit ad current position
nmap gc <Plug>(coc-git-commit)
