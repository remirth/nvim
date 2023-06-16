-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
if (not vim.g.vscode) then
    vim.cmd [[packadd packer.nvim]]

    return require('packer').startup(function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.1',
            -- or                            , branch = '0.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }

        use({ 'rose-pine/neovim', as = 'rose-pine' })

        use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
        use 'ThePrimeagen/harpoon'
        use 'ThePrimeagen/refactoring.nvim'
        use 'mbbill/undotree'
        use 'tpope/vim-fugitive'
        use("nvim-treesitter/nvim-treesitter-context");

        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v2.x',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' }, -- Required
                {
                    -- Optional
                    'williamboman/mason.nvim',
                    run = function()
                        pcall(vim.cmd, 'MasonUpdate')
                    end,
                },
                { 'williamboman/mason-lspconfig.nvim' }, -- Optional

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },     -- Required
                { 'hrsh7th/cmp-nvim-lsp' }, -- Required
                { 'L3MON4D3/LuaSnip' },     -- Required
            }
        }
        use("folke/zen-mode.nvim")
        use 'nvim-tree/nvim-web-devicons'
        use {
            "phha/zenburn.nvim",
            config = function() require("zenburn").setup() end
        }
        use {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
            config = function()
                require("copilot").setup({
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                })
            end,
        }
        use 'folke/trouble.nvim'
        use("eandrju/cellular-automaton.nvim")
        use("laytan/cloak.nvim")
        use { 'jose-elias-alvarez/null-ls.nvim' }
        use 'NLKNguyen/papercolor-theme'
        use "savq/melange-nvim"
        use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', commit = "8c17024" }
        use {
            "zbirenbaum/copilot-cmp",
            after = { "copilot.lua" },
            config = function()
                require("copilot_cmp").setup()
            end
        }
        use { 'fgheng/winbar.nvim' }
        use { 'styled-components/vim-styled-components' }
    end)
end
