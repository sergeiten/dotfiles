local load_file = require("utils.load-plugin-file")

return require("packer").startup({
    function(use)
        use({
            "wbthomason/packer.nvim",
            config = load_file("packer"),
        })
        use("lewis6991/impatient.nvim")
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
        use("jose-elias-alvarez/typescript.nvim")
        use({
            "jose-elias-alvarez/null-ls.nvim",
            config = load_file("null-ls"),
            requires = "nvim-lua/plenary.nvim",
        })
        use({
            "declancm/cinnamon.nvim",
            config = load_file("cinnamon"),
        })
        use({
            "feline-nvim/feline.nvim",
            config = load_file("feline"),
            requires = "kyazdani42/nvim-web-devicons",
        })
        use({
            "vuki656/package-info.nvim",
            config = load_file("package-info"),
            requires = "muniftanjim/nui.nvim",
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
            "broadinstitute/vim-wdl",
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
            "Glench/Vim-Jinja2-Syntax",
        })
    end,
})
