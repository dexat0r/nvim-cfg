local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

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

    use({
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {},
        keys = {}
    })

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
            require "live_server.util".install()
        end,
        cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    })
    use({ 'windwp/nvim-projectconfig' })
    use 'famiu/bufdelete.nvim'
    use "tiagovla/scope.nvim"
    use 'ThePrimeagen/vim-be-good'
    use 'folke/neodev.nvim'
    use 'f-person/git-blame.nvim'
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    use {
        "Hoffs/omnisharp-extended-lsp.nvim"
    }
    use "sindrets/diffview.nvim"
    use { "iagorrr/noctishc.nvim" }
    use { "dmmulroy/ts-error-translator.nvim" }
    use {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesitter-context").setup()
        end
    }
    use 'nanotee/sqls.nvim'
    use { 'nvimdev/hlsearch.nvim', event = 'BufRead', config = function()
        require('hlsearch').setup()
    end }
    use {
        "antosha417/nvim-lsp-file-operations",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-tree.lua",
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    }
    use {
	"xiyaowong/transparent.nvim"
    }
end)
