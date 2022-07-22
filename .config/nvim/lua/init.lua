local M = {}

require("nvim-autopairs").setup({})

local signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })

	local hl = "DiagnosticVirtualText" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local function on_attach(client, bufnr)
	-- Enable completion triggered by <C-X><C-O>
	-- See `:help omnifunc` and `:help ins-completion` for more information.
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Use LSP as the handler for formatexpr.
	-- See `:help formatexpr` for more information.
	-- vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- Configure key mappings
	require("keymaps").setup(client, bufnr)

	if client.name == "tsserver" then
		-- client.resolved_capabilities.document_formatting = false
		-- client.server_capabilities.document_formatting = false -- 0.7 and earlier
		client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
	end

	require("lsp-format").on_attach(client)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = {
	on_attach = on_attach,
	capabilities = capabilities, -- for nvim-cmp
	flags = {
		debounce_text_changes = 150,
	},
}

require("servers/dockerls").setup(opts)
require("servers/gopls").setup(opts)
require("servers/html").setup(opts)
require("servers/jdtls").setup(opts)
require("servers/jsonls").setup(opts)
require("servers/pyright").setup(opts)
require("servers/r_language_server").setup(opts)
require("servers/rust_analyzer").setup(opts)
require("servers/tsserver").setup(opts)
require("servers/vimls").setup(opts)

require("efm").setup(opts)

return M
