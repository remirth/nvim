local nnoremap = require("exsjabe.keymap").nnoremap
local inoremap = require("exsjabe.keymap").inoremap
local nnoremap = require("exsjabe.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>pw", "<cmd>w!<CR>")
nnoremap("<leader>pf", "<cmd>Format<CR>")
nnoremap("<leader>pp", "<cmd>terminal<CR>")
nnoremap("<leader>l", "/")
nnoremap("<leader>k", "<cmd>Hover<CR>")
inoremap("jj", "<esc>")

vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]]
vim.cmd [[ command! Hover execute 'lua vim.lsp.buf.hover()' ]]

if (not vim.g.vscode) then
    nnoremap("<leader>tf", "<cmd>NvimTreeFocus<CR>")
    nnoremap("<leader>trf", "<cmd>NvimTreeFindFile<CR>")
    nnoremap("<leader>tq", "<cmd>NvimTreeClose<CR>")
    nnoremap("<leader>tr", "<cmd>NvimTreeRefresh<CR>")
    nnoremap("<leader>tc", "<cmd>NvimTreeCollapse<CR>")
    nnoremap("<leader>tt", "<cmd>TransparentToggle<CR>")

    nnoremap("<leader>c", "<cmd>CodeActionMenu<CR>")
    nnoremap("<leader>a", "<C-^>")
    nnoremap("<leader>z", "<cmd>ZenMode<CR>")

    nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")
    nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>")
    nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>")
    nnoremap("<leader>fh", "<cmd>Telescope help_tags<CR>")
    nnoremap("<leader>gs", "<cmd>Telescope git_status<CR>")
    nnoremap("<leader>gaa", "<cmd>Git add .<CR>")
    nnoremap("<leader>gbb", "<cmd>Telescope git_branches<CR>")
    nnoremap("<leader>gbc", "<cmd>Telescope git_commits<CR>")
    nnoremap("<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>")

    nnoremap("<leader>qq", "<cmd>TroubleToggle<CR>")
    nnoremap("<leader>qr", "<cmd>TroubleRefresh<CR>")
    nnoremap("<leader>hf", "<cmd>Gitsigns stage_buffer<CR>")

    nnoremap("<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")

    nnoremap("<leader>ht", "<cmd>Gitsigns reset_buffer<CR>")

    nnoremap("<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")

    nnoremap("<leader>hb", "<cmd>Gitsigns blame_line<CR>")

    nnoremap("<leader>bb", "<cmd>Gitsigns toggle_current_line_blame<CR>")

    nnoremap("<leader>hd", "<cmd>Gitsigns diffthis<CR>")

    nnoremap("<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

    nnoremap("<leader>hn", "<cmd>Gitsigns next_hunk<CR>")

    nnoremap("<leader>hl", "<cmd>Gitsigns prev_hunk<CR>")

    nnoremap('<leader>ph', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
    nnoremap('<leader>pm', '<cmd>lua require("harpoon.mark").add_file()<CR>')

end
