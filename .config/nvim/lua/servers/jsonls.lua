local M = {}

function M.setup(opts)
	require("lspconfig").jsonls.setup({
		capabilities = opts.capabilities,
		init_options = {
			provideFormatter = false,
		},
	})
end

return M
