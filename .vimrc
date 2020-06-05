call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-sensible'

    " Language support
	Plug 'fatih/vim-go'
    "Plug 'govim/govim'
    Plug 'StanAngeloff/php.vim'
    Plug 'jalvesaq/Nvim-R'

    " Navigation
	Plug 'easymotion/vim-easymotion'
	Plug 'scrooloose/nerdcommenter'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

    " JavaScript / JSX
    " Plug 'pangloss/vim-javascript'
    " Plug 'othree/yajs.vim'
    " Plug 'HerringtonDarkholme/yats.vim'
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'

    " Python
    "Plug 'psf/black'

	" Colorschemes
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'crusoexia/vim-monokai'

    " Utils
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'kshenoy/vim-signature'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
	Plug 'itchyny/lightline.vim'
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'jiangmiao/auto-pairs'
    Plug 'sjl/vitality.vim'
    Plug 'gabrielelana/vim-markdown'

    " UI
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'

call plug#end()

if has("gui_running")
    set guifont=Haskplex\ Nerd:h14
    " set guifont=FuraCode\ Nerd\ Font\ Mono:h14
    " set guifont=InconsolataGo\ Nerd\ Font:h14
else
    set t_Co=256

    if !has('nvim')
        set term=screen-256color
    endif
endif



" BASIC SETTINGS
language en_US
filetype plugin indent on

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" FORCE SYNTAX
autocmd BufNewFile,BufRead *.eslintrc set syntax=json
autocmd BufNewFile,BufRead *.prettierrc set syntax=json
autocmd BufNewFile,BufRead *.vue set syntax=javascript

syntax enable
syntax on

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
"colorscheme gruvbox
colorscheme monokai
"colorscheme onedark

set ignorecase
set smartcase
set hidden
set cmdheight=1
set updatetime=100
set signcolumn=yes

" don't give |ins-completion-menu| messages.
set shortmess+=c
" set cursorline!
" set lazyredraw
" set regexpengine=1
" set synmaxcol=64
" set noshowcmd
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
set diffopt+=vertical
set title
set titlestring=%{hostname()}\ \ %F\ \ %{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

" Copy to clipboard
set clipboard=unnamed
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" Move quickfix window to bottom of window layout
autocmd FileType qf wincmd J

" Set leader key
let mapleader=","

nnoremap <Leader><Leader>c :so ~/.config/nvim/init.vim<CR>


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
autocmd FileType typescript.tsx setlocal sw=2 ts=2 sts=0 expandtab
autocmd FileType json setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType css setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType scss setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType html setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType vue setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType yaml setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType make set noexpandtab

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
let g:go_fmt_autosave = 0
" let g:go_mod_fmt_autosave = 0
" let g:go_doc_keywordprg_enabled = 0
" let g:go_decls_mode = 'fzf'
" let g:go_fmt_command = "goimports"
" let g:go_def_mapping_enabled = 0
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" let g:go_list_type="quickfix"
" " let g:go_metalinter_command = "golangci-lint"
" " let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_enabled = []
" " let g:go_metalinter_autosave = 0

" au FileType go nmap <F9> :GoCoverageToggle -short<cr>


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " GO KEYBINDINGS
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au FileType go nmap <Leader>l <Plug>(go-metalinter)

" " autocmd FileType go nmap <leader>b  <Plug>(go-build)
" " autocmd FileType go nmap <leader>r  <Plug>(go-run)
" " autocmd FileType go nmap <leader>t  <Plug>(go-test)

" autocmd FileType go nmap <C-\> :GoDecls<CR>
" " autocmd FileType go nmap <Leader>w :GoAlternate<CR>

" autocmd FileType go nmap <Leader>i <Plug>(go-info)
" autocmd FileType go nmap <Leader>d <Plug>(go-doc)

" " Jump between errors in quickfix list
" map <C-]> :cnext<CR>
" map <C-[> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>

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
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>e :Ag<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>r :BTags<CR>

let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LIGHTLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
\ 'colorscheme': 'molokai',
\ 'active': {
\   'left': [['mode', 'paste'], ['icongitbranch'], ['cocstatus'], ['filepath', 'modified']],
\   'right': [['fileicon'], ['lineinfo'], ['charvaluehex', 'fileformat', 'fileencoding', 'filetype']]
\ },
\ 'component': {
\   'charvaluehex': '0x%B',
\   'filepath': '%F',
\ },
\ 'component_function': {
\	'cocstatus': 'coc#status',
\   'fileicon': 'MyFiletype',
\   'icongitbranch': 'DrawGitBranchInfo',
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

function! DrawGitBranchInfo()
  let branch = fugitive#head()
  return len(branch) > 0 ? " " . branch : ""
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display hidden files
let NERDTreeShowHidden=1
let NERDTreeWinSize=30
let NERDTreeHijackNetrw=0
let NERDTreeMinimalUI=1

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIgnore = ['^node_modules$']

" Disable lightline for NERDTree buffer
augroup filetype_nerdtree
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Custom icon for coc.nvim statusline
let g:coc_status_error_sign=" "
let g:coc_status_warning_sign=" "

set statusline^=%{coc#status()}%{StatusDiagnostic()}

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,go,javascript,css setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList grep -I -S -ignorecase -w -u symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISTA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close vista window automatically when it's the last window
" autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsVisible() | execute "normal! :q!\<CR>" | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BLACK
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufWritePre *.py execute ':Black'
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ludovicchabant/vim-gutentags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:gutentags_trace = 1
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*", "Pods"]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tpope/vim-fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sjl/vitality.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto save all files when focus is lost or when switching buffers
autocmd FocusLost,BufLeave * :wa
