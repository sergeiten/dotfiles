local M = {}

function M.setup(opts)
	require("lspconfig").gopls.setup({
		capabilities = opts.capabilities,
		on_attach = opts.on_attach,

		cmd = { "gopls", "serve" },
		filetypes = { "go", "gomod" },
		root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
			},
		},
	})
end

return M
