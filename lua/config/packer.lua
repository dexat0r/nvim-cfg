vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip',
                requires = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" }
            },

            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' }
        }
    }

    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }
    use "christoomey/vim-tmux-navigator"

    -- buffer line support
    use "akinsho/bufferline.nvim"

    -- auto pairs
    use "windwp/nvim-autopairs"

    -- bottom informative line
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'folke/tokyonight.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use "rebelot/kanagawa.nvim"
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    })
    use({
        "stevearc/conform.nvim",
    })
    use {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    }
    use {
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    }
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'rcarriga/nvim-notify' }
    use({
        "ErichDonGubler/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })
    use({
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim"
        }
    })
    use { 'kassio/neoterm' }
    use 'karb94/neoscroll.nvim'
    use 'yamatsum/nvim-cursorline'
    use {
        'nvimdev/dashboard-nvim',
        event = "VimEnter",
        config = function()
            require('config.dashboard')
            require('config.dashboard.custom_header')
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use "lukas-reineke/indent-blankline.nvim"
    use {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "gf", require("actions-preview").code_actions)
        end,
    }
    use({
        'Wansmer/treesj',
        requires = { 'nvim-treesitter/nvim-treesitter' },
    })
    use({
        "aurum77/live-server.nvim",
        run = function()
            require"live_server.util".install()
        end,
        cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    })
end)
