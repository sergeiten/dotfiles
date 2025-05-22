local load_file = require("utils.load-plugin-file")

return require("packer").startup({
	function(use)
		use({
			"wbthomason/packer.nvim",
			config = load_file("packer"),
		})
		use("b0o/schemastore.nvim")
		use("christoomey/vim-tmux-navigator")
		use("tanvirtin/monokai.nvim")
		use({
			"nvim-telescope/telescope.nvim",
			config = load_file("telescope"),
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					run = "make",
				},
			},
		})
		use({
			"kyazdani42/nvim-tree.lua",
			after = "nvim-web-devicons",
			config = load_file("nvim-tree"),
			requires = "kyazdani42/nvim-web-devicons",
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			config = load_file("nvim-treesitter"),
			run = ":TSUpdate all",
			requires = "nvim-treesitter/playground",
		})
		use({
			"hrsh7th/nvim-cmp",
			config = load_file("nvim-cmp"),
			requires = {
				{
					"onsails/lspkind.nvim",
					config = load_file("lspkind"),
				},
				{
					"l3mon4d3/LuaSnip",
					--config = load_file("snippets"),
				},
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-cmdline",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				"hrsh7th/cmp-nvim-lsp-signature-help",
			},
		})
		use("neovim/nvim-lspconfig")
		use({
			"williamboman/mason.nvim",
			config = load_file("mason"),
			branch = "main",
			requires = {
				{ "williamboman/mason-lspconfig.nvim" },
				{ "whoissethdaniel/mason-tool-installer.nvim" },
			},
		})
		-- use("jose-elias-alvarez/typescript.nvim")
		use("sergeiten/typescript.nvim")
		--use({
		--	"jose-elias-alvarez/null-ls.nvim",
		--	config = load_file("null-ls"),
		--	requires = "nvim-lua/plenary.nvim",
		--})
		use({
			"karb94/neoscroll.nvim",
			config = load_file("neoscroll"),
		})
		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = load_file("nvim-autopairs"),
		})
		use({
			"numtostr/comment.nvim",
			config = load_file("comment"),
			requires = "joosepalviste/nvim-ts-context-commentstring",
		})
		use({
			"lewis6991/gitsigns.nvim",
			config = load_file("gitsigns"),
			requires = "nvim-lua/plenary.nvim",
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = load_file("indent-blankline"),
		})
		use({
			"tpope/vim-fugitive",
			config = load_file("vim-fugitive"),
		})
		use({
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			requires = "nvim-lua/plenary.nvim",
			config = load_file("harpoon"),
		})
		use({
			"EmranMR/tree-sitter-blade",
		})
		use({
			"jwalton512/vim-blade",
		})
		use({
			"rmagatti/goto-preview",
			config = function()
				require("goto-preview").setup({})
			end,
		})
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons", opt = true },
			config = load_file("lualine"),
		})
		use({
			"dmmulroy/ts-error-translator.nvim",
			config = function()
				require("ts-error-translator").setup()
			end,
		})
		use({
			"ray-x/go.nvim",
			config = function()
				require("go").setup()
			end,
		})
		use("ray-x/guihua.lua") -- recommended if need floating window support
		use({
			"stevearc/oil.nvim",
			config = load_file("oil"),
		})
		use({
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
		})
		-- use({
		-- 	"jake-stewart/multicursor.nvim",
		-- 	branch = "1.0",
		-- 	config = load_file("multicursor"),
		-- })

		-- use({
		-- 	"andythigpen/nvim-coverage",
		-- 	requires = "nvim-lua/plenary.nvim",
		-- 	-- Optional: needed for PHP when using the cobertura parser
		-- 	rocks = { "lua-xmlreader" },
		-- 	config = load_file("nvim-coverage"),
		-- })
		use({
			"mfussenegger/nvim-lint",
			config = load_file("nvim-lint"),
		})
		use({
			"stevearc/conform.nvim",
			config = load_file("conform"),
		})
		use({
			"nvim-flutter/flutter-tools.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
			config = load_file("flutter-tools"),
		})
	end,
})
