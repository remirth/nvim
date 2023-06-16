vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.undofile = true
vim.opt.undodir = os.getenv("localappdata") .. "/.vim/undodir"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.smartindent = true
vim.opt.termguicolors = true

vim.opt.wrap = false
vim.g.mapleader = " "
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50
vim.opt.termguicolors = true

vim.api.nvim_set_option("clipboard", "unnamed")
