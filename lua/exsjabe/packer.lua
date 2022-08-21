-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "EdenEast/nightfox.nvim"
  use 'github/copilot.vim'
  use 'folke/trouble.nvim'
  use 'vim-airline/vim-airline' 
  use 'norcalli/nvim-colorizer.lua'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'tpope/vim-fugitive'
  use 'xiyaowong/nvim-transparent'
  use 'Carlosiano/vim-synthwave84'
  use 'nvim-lua/plenary.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'Rigellute/shades-of-purple.vim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'simrat39/rust-tools.nvim'

  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-treesitter/nvim-treesitter"}
    }
}

-- Debugging
  use 'mfussenegger/nvim-dap'
  use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
  end) 
