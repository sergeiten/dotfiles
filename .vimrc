set shell=$SHELL

call plug#begin()
    Plug 'neovim/nvim-lspconfig'
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'

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
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'

    " UI
    Plug 'ryanoasis/vim-devicons'

    Plug 'williamboman/nvim-lsp-installer'
    Plug 'rcarriga/nvim-notify'

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

    Plug 'puremourning/vimspector'

    Plug 'ThePrimeagen/harpoon'

    Plug 'broadinstitute/vim-wdl'
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
" au BufRead,BufNewFile *.wdl set filetype=hocon

syntax enable
syntax on

let&t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
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
set timeoutlen=200

" Copy to clipboard
set clipboard=unnamed
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
vnoremap <leader>p "_dP

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
" TELESCOPE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>f <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>r <cmd>:lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap ; <cmd>:lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<cr>
nnoremap \ <cmd>:lua require('telescope.builtin').oldfiles()<cr>


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
" tpope/vim-fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gf :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" kyazdani42/nvim-tree.lua
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nnoremap <leader>h :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hn :lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>hp :lua require("harpoon.ui").nav_prev()<CR>
nnoremap <leader>h1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>h2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>h3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>h4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>h5 :lua require("harpoon.ui").nav_file(5)<CR>

nnoremap <silent> <C-6> <C-^>
