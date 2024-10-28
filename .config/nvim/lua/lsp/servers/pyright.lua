local lsp = require("lspconfig")
local util = require("lspconfig.util")

local bin = "pyright-langserver"
local cmd = { bin, "--stdio" }

local root_files = {
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"pyrightconfig.json",
	".git",
}

local capabilities = require("lsp.utils.capabilities")

lsp.pyright.setup({
	capabilities = capabilities,
	cmd = cmd,
	filetypes = { "python" },
	root_dir = util.root_pattern(unpack(root_files)),
	single_file_support = true,
	flags = { debounce_text_changes = 300 },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
				autoImportCompletions = true,
			},
		},
	},
})
