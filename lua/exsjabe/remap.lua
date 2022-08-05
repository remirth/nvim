local nnoremap = require("exsjabe.keymap").nnoremap
local inoremap = require("exsjabe.keymap").inoremap
local nnoremap = require("exsjabe.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>pw", "<cmd>w<CR>")
nnoremap("<leader>pf", "<cmd>Format<CR>")
nnoremap("<leader>pp", "<cmd>terminal<CR>")
inoremap("jj", "<esc>")

vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]]

nnoremap("<leader>tf", "<cmd>NvimTreeFocus<CR>")
nnoremap("<leader>tr", "<cmd>NvimTreeRefresh<CR>")
nnoremap("<leader>tc", "<cmd>NvimTreeCollapse<CR>")
nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<CR>")

nnoremap("<leader>qq", "<cmd>TroubleToggle<CR>")
nnoremap("<leader>qr", "<cmd>TroubleRefresh<CR>")
