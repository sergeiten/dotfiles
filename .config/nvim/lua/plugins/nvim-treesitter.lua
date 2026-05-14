-- Name: Treesitter Nvim
-- Description: Treesitter proxy for nvim
-- Link: https://github.com/nvim-treesitter/nvim-treesitter

-- Register custom blade parser
vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		require("nvim-treesitter.parsers").blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}
	end,
})

local parsers = {
	"php", "go", "css", "scss", "bash", "make", "markdown", "html",
	"typescript", "toml", "dockerfile", "vim", "rust", "javascript",
	"json", "python", "gomod", "lua", "java", "yaml", "tsx", "dart",
}

-- Install parsers that aren't already installed
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		local installed = require("nvim-treesitter").get_installed("parsers")
		local installed_set = {}
		for _, p in ipairs(installed) do
			installed_set[p] = true
		end
		local missing = vim.tbl_filter(function(p)
			return not installed_set[p]
		end, parsers)
		if #missing > 0 then
			require("nvim-treesitter").install(missing)
		end
	end,
})

-- Enable treesitter highlighting and indentation for all relevant filetypes
local filetypes = {
	"php", "go", "css", "scss", "bash", "make", "markdown", "html",
	"typescript", "dockerfile", "vim", "rust", "javascript",
	"json", "python", "lua", "java", "yaml", "tsx", "dart", "blade",
	"toml", "gomod",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- Disable highlight for very large files
vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function(ev)
		if vim.api.nvim_buf_line_count(ev.buf) > 5000 then
			vim.treesitter.stop(ev.buf)
		end
	end,
})

