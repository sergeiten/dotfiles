local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.dartls.setup({
	cmd = { "dart", "language-server", "--protocol=lsp" },
	filetypes = { "dart" },
	init_options = {
		closingLabels = true,
		outline = true,
		flutterOutline = true,
	},
	settings = {
		dart = {
			enableSdkFormatter = true,
		},
	},
	on_attach = function(client, bufnr)
		-- keybindings or other attach logic
	end,
	capabilities = capabilities,
})
