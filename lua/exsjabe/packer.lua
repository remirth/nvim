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
        use("github/copilot.vim")
        use 'nvim-tree/nvim-web-devicons'
        use 'folke/trouble.nvim'
        use("eandrju/cellular-automaton.nvim")
        use("laytan/cloak.nvim")
        use('MunifTanjim/prettier.nvim')
        use('jose-elias-alvarez/null-ls.nvim')
        use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    end)
end
