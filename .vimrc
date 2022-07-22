set shell=$SHELL

call plug#begin()
    Plug 'neovim/nvim-lspconfig'
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'
    " Plug 'ray-x/guihua.lua' " float term, codeaction and codelens gui support

    Plug 'nvim-lua/plenary.nvim'
    " Navigation
    Plug 'easymotion/vim-easymotion'
    Plug 'christoomey/vim-tmux-navigator'

    Plug 'tpope/vim-commentary'

    " Colorschemes
    Plug 'tanvirtin/monokai.nvim'

    Plug 'nvim-telescope/telescope.nvim'

    " Utils
    Plug 'kshenoy/vim-signature'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'itchyny/lightline.vim'
    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Plug 'junegunn/fzf.vim'
    " Plug 'ludovicchabant/vim-gutentags'
    " Plug 'sjl/vitality.vim'
    " Plug 'preservim/tagbar'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    " Plug 'github/copilot.vim'

    " UI
    Plug 'ryanoasis/vim-devicons'
    " Plug 'airblade/vim-gitgutter'

    " Plug 'L3MON4D3/LuaSnip'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'rcarriga/nvim-notify'
    " Plug 'ray-x/lsp_signature.nvim'

    " CMP
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'ray-x/cmp-treesitter'
    " Plug 'hrsh7th/cmp-cmdline'
    " Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-nvim-lsp'

    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    Plug 'windwp/nvim-autopairs'

    Plug 'lukas-reineke/lsp-format.nvim'

    " Plug 'ray-x/go.nvim'
    "
    Plug 'puremourning/vimspector'

    Plug 'ThePrimeagen/harpoon'
call plug#end()

if has("gui_running")
    set guifont=PragmataPro\ Nerd\ Font:h12
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

" FORCE SYNTAX
" autocmd BufNewFile,BufRead *.eslintrc set syntax=json
" autocmd BufNewFile,BufRead *.prettierrc set syntax=json
" autocmd BufNewFile,BufRead *.jsonl set syntax=json
" autocmd BufNewFile,BufRead *.vue set syntax=javascript
" autocmd BufNewFile,BufRead *.tx set syntax=typescript
" autocmd BufNewFile,BufRead *.tsx set syntax=typescript.tsx

" au BufRead,BufNewFile .env set filetype=text
au BufRead,BufNewFile *.wdl set filetype=hocon

syntax enable
syntax on

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_ut = ''

set background=dark
colorscheme monokai

set ignorecase
set smartcase
set hidden
set cmdheight=2
set updatetime=50
set signcolumn=yes

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
set completeopt=menu,noinsert,noselect
set laststatus=3
set numberwidth=1
set fileencoding=utf-8
set encoding=utf-8
set autoread
set nobackup
set undodir=~/.vim/undodir
set undofile
set cursorline
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

let mapleader = "\<Space>"

nnoremap <Leader><Leader>c :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader><Leader>v :vsplit $MYVIMRC<CR>

" inoremap jk <ESC>

let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/opt/homebrew/bin/python3'


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
autocmd FileType javascriptreact setlocal sw=2 ts=2 sts=2 expandtab
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
" FZF
" junegunn/fzf.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set rtp+=/opt/homebrew/bin/fzf

" nmap \ :Buffers<CR>
" nmap ,f :Files<CR>
" nmap ,e :Ag<CR>
" nmap ,t Tags<CR>
" nmap ,r :BTags<CR>
" nmap ,b :BLines<CR>

" let $FZF_DEFAULT_OPTS .= ' --inline-info'

" command! -nargs=? -complete=dir Files
"   \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
"   \   'source': 'fd --type f --hidden --follow --exclude .git --exclude .idea --exclude bin --no-ignore . '.expand(<q-args>)
"   \ })))


" let g:fzf_buffers_jump = 1
" let g:fzf_layout = { 'down': '~40%' }
" let g:fzf_colors = {
"     \ 'fg':      ['fg', 'Normal'],
"     \ 'bg':      ['bg', 'Normal'],
"     \ 'hl':      ['fg', 'Comment'],
"     \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"     \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"     \ 'hl+':     ['fg', 'Statement'],
"     \ 'info':    ['fg', 'PreProc'],
"     \ 'border':  ['fg', 'Ignore'],
"     \ 'prompt':  ['fg', 'Conditional'],
"     \ 'pointer': ['fg', 'Exception'],
"     \ 'marker':  ['fg', 'Keyword'],
"     \ 'spinner': ['fg', 'Label'],
"     \ 'header':  ['fg', 'Comment'] }

" function! s:tags_sink(line)
"   let parts = split(a:line, '\t\zs')
"   let excmd = matchstr(parts[2:], '^.*\ze;"\t')
"   execute 'silent e' parts[1][:-2]
"   let [magic, &magic] = [&magic, 0]
"   execute excmd
"   let &magic = magic
" endfunction

" function! s:tags()
"   if empty(tagfiles())
"     echohl WarningMsg
"     echom 'Preparing tags'
"     echohl None
"     call system('ctags -R')
"   endif

"   call fzf#run({
"   \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
"   \            '| grep -v -a ^!',
"   \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
"   \ 'down':    '40%',
"   \ 'sink':    function('s:tags_sink')})
" endfunction

" command! Tags call s:tags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TELESCOPE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>f <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>r <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap \ <cmd>Telescope buffers<cr>


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

function! DrawGitBranchInfo()
  let branch = FugitiveHead()
  return len(branch) > 0 ? " " . branch : ""
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ludovicchabant/vim-gutentags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:gutentags_trace = 1
" set statusline+=%{gutentags#statusline()}
" let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*", "Pods"]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tpope/vim-fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gf :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sjl/vitality.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto save all files when focus is lost or when switching buffers
" autocmd FocusLost,BufLeave * :wa

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" preservim/tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <C-m> :TagbarToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" kyazdani42/nvim-tree.lua
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:nvim_tree_gitignore = 0 "0 by default
" let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
" let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
" let g:nvim_tree_git_hl = 0 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
" let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
" let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
" let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
" let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
" let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
" let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
" let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
" let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
" let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
" let g:nvim_tree_window_picker_exclude = {
"     \   'filetype': [
"     \     'notify',
"     \     'packer',
"     \     'qf'
"     \   ],
"     \   'buftype': [
"     \     'terminal'
"     \   ]
"     \ }
" " Dictionary of buffer option names mapped to a list of option values that
" " indicates to the window picker that the buffer's window should not be
" " selectable.
" let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
"let g:nvim_tree_show_icons = {
"    \ 'git': 0,
"    \ 'folders': 1,
"    \ 'files': 1,
"    \ 'folder_arrows': 1,
"    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
"let g:nvim_tree_icons = {
"    \ 'default': '',
"    \ 'symlink': '',
"    \ 'git': {
"    \   'unstaged': "✗",
"    \   'staged': "✓",
"    \   'unmerged': "",
"    \   'renamed': "➜",
"    \   'untracked': "★",
"    \   'deleted': "",
"    \   'ignored': "◌"
"    \   },
"    \ 'folder': {
"    \   'arrow_open': "",
"    \   'arrow_closed': "",
"    \   'default': "",
"    \   'open': "",
"    \   'empty': "",
"    \   'empty_open': "",
"    \   'symlink': "",
"    \   'symlink_open': "",
"    \   }
"    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <C-u> :NvimTreeFocus<CR>
" nnoremap <C-r> :NvimTreeRefresh<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>

autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

autocmd TermOpen * setlocal nonumber norelativenumber
autocmd BufReadPost quickfix setlocal nonumber norelativenumber

augroup terminal_settings
    autocmd!

    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert

    " Ignore various filetypes as those will close terminal automatically
    " Ignore fzf, ranger, coc
    autocmd TermClose term://*
          \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
          \   call nvim_input('<CR>')  |
          \ endif
augroup END

nnoremap <leader>t :sp term://zsh<cr>
nnoremap <leader>tv :vs term://zsh<cr>

nnoremap <leader>c :lclose \| :cclose<cr>


" Make terminal mode behave more like any other mode
tnoremap <C-[> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <A-k> <C-\><C-n><C-W>+i
tnoremap <A-j> <C-\><C-n><C-W>-i
tnoremap <A-h> <C-\><C-n>3<C-W>>i
tnoremap <A-l> <C-\><C-n>3<C-W><i

" Resize windows with the alt+hjkl keys
nnoremap ˚ 10<C-W>+
nnoremap ∆ 10<C-W>-
nnoremap ˙ 3<C-W><
nnoremap ¬ 3<C-W>>

lua require('init')
lua require('cmp-config')
lua require('treesitter')
lua require('nvim-tree-config')
lua require('telescope-config')

lua vim.lsp.set_log_level("OFF")


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimspector.vim
" puremourning/vimspector
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>vl :call vimspector#Launch()<CR>
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput
nmap <leader>vi <Plug>VimspectorBalloonEval
xmap <leader>vi <Plug>VimspectorBalloonEval
let g:vimspector_install_gadgets = [ 'debugpy', 'delve', 'CodeLLDB', 'vscode-node-debug2' ]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" harpoon
" ThePrimeagen/harpoon
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>q :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>n :lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>p :lua require("harpoon.ui").nav_prev()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>5 :lua require("harpoon.ui").nav_file(5)<CR>

nnoremap <silent> <C-6> <C-^>
