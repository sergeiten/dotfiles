local M = {}

function M.setup(opts)
	require("lspconfig").html.setup({
		capabilities = opts.capabilities,
		on_attach = opts.on_attach,
	})
end

return M
