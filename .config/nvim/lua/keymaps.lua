local M = {}

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

local opts = { noremap = true, silent = true }

local function keymappings(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Key mappings
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.get_prev()<CR>", opts)
	buf_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.get_next()<CR>", opts)
	buf_keymap(
		bufnr,
		"n",
		"<space>[",
		"<cmd>lua vim.diagnostic.get_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
		opts
	)
	buf_keymap(
		bufnr,
		"n",
		"<space>]",
		"<cmd>lua vim.diagnostic.get_next({severity = vim.diagnostic.severity.ERROR})<CR>",
		opts
	)

	-- keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_keymap(bufnr, "n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_keymap(bufnr, "n", "<space>e", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	buf_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_keymap(bufnr, "n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_keymap(bufnr, "n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- buf_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

function M.setup(client, bufnr)
	keymappings(client, bufnr)
end

return M
