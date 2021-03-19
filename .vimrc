call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'

    " Language support
    Plug 'fatih/vim-go'
    Plug 'jalvesaq/Nvim-R'
    Plug 'ekalinin/Dockerfile.vim'

    " Navigation
    Plug 'easymotion/vim-easymotion'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tpope/vim-commentary'

    " JavaScript / TypeScript / JSX
    Plug 'pangloss/vim-javascript'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'maxmellon/vim-jsx-pretty'
    " Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

    " Colorschemes
    Plug 'ayu-theme/ayu-vim'
    Plug 'morhetz/gruvbox'
    Plug 'crusoexia/vim-monokai'

    " Utils
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'kshenoy/vim-signature'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'jiangmiao/auto-pairs'
    Plug 'sjl/vitality.vim'
    Plug 'mbbill/undotree'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " UI
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'

call plug#end()

if has("gui_running")
    set guifont=Haskplex\ Nerd\ Regular:h14
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

" autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" FORCE SYNTAX
autocmd BufNewFile,BufRead *.eslintrc set syntax=json
autocmd BufNewFile,BufRead *.prettierrc set syntax=json
autocmd BufNewFile,BufRead *.vue set syntax=javascript
autocmd BufNewFile,BufRead *.tx set syntax=typescript
autocmd BufNewFile,BufRead *.tsx set syntax=typescript.tsx
" autocmd BufNewFile,BufRead *.tsx set syntax=javascript

syntax enable
syntax on

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
colorscheme monokai
" colorscheme gruvbox

set ignorecase
set smartcase
set hidden
set cmdheight=2
set updatetime=50
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
set splitright
" set completeopt-=preview
set completeopt=menuone,noinsert,noselect
set laststatus=2
set numberwidth=1
set fileencoding=utf-8
set encoding=utf-8
set autoread
set nobackup
set undodir=~/.vim/undodir
set undofile
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

au FocusGained * :checktime

" Set leader key
let g:mapleader=","

nnoremap <Leader><Leader>c :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader><Leader>v :vsplit $MYVIMRC<CR>

inoremap jk <ESC>

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
autocmd FileType typescript setlocal sw=2 ts=2 sts=0 expandtab
autocmd FileType typescript.tsx setlocal sw=2 ts=2 sts=0 expandtab
autocmd FileType typescriptreact setlocal sw=2 ts=2 sts=0 expandtab
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

" let g:go_code_completion_enabled = 0
" let g:go_auto_type_info = 0
" let g:go_fmt_autosave = 0
" let g:go_mod_fmt_autosave = 0
" let g:go_doc_keywordprg_enabled = 0
" let g:go_decls_mode = 'fzf'
" let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" let g:go_list_type="quickfix"
" let g:go_metalinter_command = "golangci-lint"
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_enabled = []
" let g:go_metalinter_autosave = 0

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
" telescope.nvim
" nvim-lua/popup.nvim
" nvim-lua/plenary.nvim'
" nvim-telescope/telescope.nvim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>f <cmd>Telescope find_files<cr>
" nnoremap <leader>e <cmd>Telescope live_grep<cr>
" nnoremap ; <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
" junegunn/fzf.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf

nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>e :Ag<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>r :BTags<CR>
nmap <Leader>b :BLines<CR>

let $FZF_DEFAULT_OPTS .= ' --inline-info'

command! -nargs=? -complete=dir Files
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --exclude .idea --exclude bin --no-ignore . '.expand(<q-args>)
  \ })))


let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~40%' }
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
\   'left': [['mode', 'paste'], ['icongitbranch'], ['filename', 'modified']],
\   'right': [['fileicon'], ['lineinfo'], ['charvaluehex', 'fileformat', 'fileencoding', 'filetype']]
\ },
\ 'component': {
\   'charvaluehex': '0x%B',
\ },
\ 'component_function': {
\   'fileicon': 'MyFiletype',
\   'icongitbranch': 'DrawGitBranchInfo',
\ },
\}

" function! LightLineCocGitStatus()
"   let gstatus = get(g:, 'coc_git_status')
"   let bstatus = get(b:, 'coc_git_status', {})
"   if empty(gstatus)
"     return ''
"   endif
"   return gstatus . ' ' . bstatus
" endfunction

function! DrawGitBranchInfo()
  let branch = fugitive#head()
  return len(branch) > 0 ? " " . branch : ""
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
" scrooloose/nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display hidden files
let NERDTreeShowHidden=1
let NERDTreeWinSize=30
let NERDTreeHijackNetrw=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeDirArrows=1

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

nmap <leader>, :NERDTreeFind<CR>

" let g:NERDTreeIgnore = ['^node_modules$']
let g:nerdtree_tabs_open_on_gui_startup=0

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

nmap <silent> gdv :call CocAction('jumpDefinition', 'vsplit')<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

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
" ludovicchabant/vim-gutentags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:gutentags_trace = 1
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*", "Pods"]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tpope/vim-fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gf :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sjl/vitality.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto save all files when focus is lost or when switching buffers
autocmd FocusLost,BufLeave * :wa


highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Integrated Terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <leader>t :call OpenTerminal()<CR>
