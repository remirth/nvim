-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
if (not vim.g.vscode) then
  vim.cmd [[packadd packer.nvim]]

  return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      -- or                            , branch = '0.1.x',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'Mofiqul/vscode.nvim'


    use({ 'rebelot/kanagawa.nvim' })
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use({
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!:).
      run = "make install_jsregexp"
    })


    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { { "nvim-lua/plenary.nvim" } }
    }
    use 'mbbill/undotree'
    use 'aktersnurra/no-clown-fiesta.nvim'
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
      }
    }
    use("folke/zen-mode.nvim")
    use 'nvim-tree/nvim-web-devicons'
    use 'folke/trouble.nvim'
    use("laytan/cloak.nvim")
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use('MunifTanjim/prettier.nvim')
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', commit = "8c17024" }
    use { 'fgheng/winbar.nvim' }
  end)
end
