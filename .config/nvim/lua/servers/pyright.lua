local M = {}

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
}

-- local function organize_imports()
-- 	local params = {
-- 		command = "pyright.organizeimports",
-- 		arguments = { vim.uri_from_bufnr(0) },
-- 	}
-- 	vim.lsp.buf.execute_command(params)
-- end

function M.setup(opts)
	require("lspconfig").pyright.setup({
		capabilities = opts.capabilities,
		on_attach = opts.on_attach,
		cmd = cmd,
		filetypes = { "python" },
		root_dir = util.root_pattern(unpack(root_files)),
		single_file_support = true,
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
end

return M
