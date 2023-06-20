local set_sign = require("utils.set-sign")
local LSP_ICONS = require("lsp.utils.icons")

------------------------------------------------------------------------------------------
----------------------------------- GLOBAL -----------------------------------------------
------------------------------------------------------------------------------------------
-- Set leader
vim.g.mapleader = " "

-- Sync nvim clipboard with sys clipboard
vim.opt.clipboard = "unnamedplus"

-- Highlight line you are on
vim.opt.cursorline = true

-- Enables search results as you type
vim.opt.incsearch = true

-- Enables smart indenting
vim.opt.smartindent = true

-- Time after the buffer is saved
vim.opt.updatetime = 300

-- Enables mouse scroll
vim.opt.mouse = "a"

-- Disables swap files
vim.opt.swapfile = false

-- Enables undo files
vim.opt.undofile = true

-- Convert tab to 4 spaces
vim.opt.tabstop = 4

-- Correctly indent lines inside blocks
vim.opt.shiftwidth = 4

-- Enables tab to space conversion
vim.opt.expandtab = true

-- Prefer opening new buffers to the right
vim.opt.splitright = true

-- Prefer opening new buffers below
vim.opt.splitbelow = true

-- Enable nvim set colors
vim.opt.termguicolors = true

-- Enable changing buffers without saving
vim.opt.hidden = true

-- Ignore case when searching
vim.opt.ignorecase = true

-- Ignore case when searching
vim.opt.wildignorecase = true

-- Search with cases sensitive only if search query isn't the same case
vim.opt.smartcase = true

-- Show relative line numbers in the sidebar
vim.opt.relativenumber = true

-- Show sidebar
vim.opt.signcolumn = "yes"

-- Show current line number
vim.opt.number = true

-- Disables line wrapping
vim.opt.wrap = true

-- Enable spellcheck
vim.opt.spell = false

-- Spelling language
vim.opt.spelllang = "en"

-- Don't check if line starts with capital letter
vim.opt.spellcapcheck = ""

-- Number of spell suggestions
vim.opt.spellsuggest = "7"

-- Support camel case spelling
vim.opt.spelloptions = "camel"

-- Use only one global statusline
vim.opt.laststatus = 3

-- Don't redraw screen when using macros (performance increase)
vim.opt.lazyredraw = true

-- Scroll offset
vim.opt.scrolloff = 15

-- Scroll amount
vim.opt.scroll = 15

-- Hide command bar
vim.opt.cmdheight = 0

------------------------------------------------------------------------------------------
------------------------------------ MISC ------------------------------------------------
------------------------------------------------------------------------------------------

vim.cmd([[
    " Enable syntax
    syntax on

    autocmd FileType javascript setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType javascript.jsx setlocal sw=2 ts=2 sts=0 expandtab
    autocmd FileType javascriptreact setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType typescript setlocal sw=2 ts=2 sts=0 expandtab
    autocmd FileType typescript.tsx setlocal sw=2 ts=2 sts=0 expandtab
    autocmd FileType typescriptreact setlocal sw=2 ts=2 sts=0 expandtab
    autocmd FileType json setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType jsonc setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType css setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType scss setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType html setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType vue setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType yaml setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType jinja.html setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType wdl setlocal sw=2 ts=2 sts=2 expandtab
    autocmd FileType make set noexpandtab


    " Don't continue comment when adding a new line above/under comment
    autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

    " Disable unused providers
    let g:loaded_perl_provider=0
    let g:loaded_ruby_provider=0
    let g:loaded_python3_provider=0
    let g:loaded_node_provider=0

    " Fix cursor hold
    let g:cursorhold_updatetime = 100

    colorscheme monokai

    " Remove row numbers from terminal
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

    au FocusLost * :wa
]])

-- Ignore capitalized word misspelling
vim.cmd([[
    fun! IgnoreCamelCaseSpell()
        syn match myExCapitalWords +\<\w*[A-Z]\K*\>+ contains=@NoSpell
    endfun

    autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()
]])

set_sign({
    list = {
        { name = "DiagnosticSignError", sign = LSP_ICONS.ERROR, highlight_group = "DiagnosticSignError" },
        { name = "DiagnosticSignWarn", sign = LSP_ICONS.WARNING, highlight_group = "DiagnosticSignWarn" },
        { name = "DiagnosticSignInfo", sign = LSP_ICONS.INFO, highlight_group = "DiagnosticSignInfo" },
        { name = "DiagnosticSignHint", sign = LSP_ICONS.HINT, highlight_group = "DiagnosticSignHint" },
    },
})

-- Show diagnostic source name
vim.diagnostic.config({
    virtual_text = {
        source = "always",
        prefix = "●",
    },
    severity_sort = true,
    float = {
        source = "always",
    },
})

-- Disable diagnostic for .env files
local group = vim.api.nvim_create_augroup("__env", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = ".env",
    group = group,
    callback = function(args)
        vim.diagnostic.disable(args.buf)
    end
})

-- vim.lsp.set_log_level('debug')
