local M = {}

function M.setup(opts)
	require("lspconfig").r_language_server.setup({
		capabilities = opts.capabilities,
		on_attach = opts.on_attach,
	})
end

return M
