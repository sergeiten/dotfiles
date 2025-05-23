-- Name: Cmp
-- Description: Autocompletion
-- Link: https://github.com/hrsh7th/nvim-cmp

local cmp = require("cmp")
local snippets = require("luasnip")
local icons = require("lspkind")

local has_words_before = function()
	local line, column = unpack(vim.api.nvim_win_get_cursor(0))

	return column ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(column, column):match("%s") == nil
end

--------------------------------------------------------------------------------------------
------------------------------------- SETUP ------------------------------------------------
--------------------------------------------------------------------------------------------

-- Fix tabbing
-- vim.o.completeopt = "menuone,noselect"
vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
	experimental = { native_menu = false, ghost_text = false },
	snippet = {
		expand = function(args)
			snippets.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-SPACE>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
	},
	formatting = {
		format = icons.cmp_format({
			maxwidth = {
				-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				-- can also be a function to dynamically calculate max width such as
				-- menu = function() return math.floor(0.45 * vim.o.columns) end,
				menu = 50, -- leading text (labelDetails)
				abbr = 50, -- actual suggestion item
			},
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_document_symbol" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{
			name = "buffer",
			max_item_count = 15,
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{
			name = "path",
			max_item_count = 15,
		},
		{
			name = "nvim_lua",
			max_item_count = 20,
		},
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.score,
		},
	},
})

-- Command source for commands
cmp.setup.cmdline(":", {
	completion = { autocomplete = false },
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
	mapping = cmp.mapping.preset.cmdline(),
})

-- Buffer source for search
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
	mapping = cmp.mapping.preset.cmdline(),
})
