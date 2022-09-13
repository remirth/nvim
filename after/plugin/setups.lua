if (not vim.g.vscode) then

    tree = require('nvim-tree')
    tree.setup()

    require('trouble').setup()
    require('refactoring').setup({})

    require('nvim-lightbulb').setup({
        autocmd = {
            enabled = true
        }
    })
    require('zen-mode').setup()
    vim.notify = require("notify")
end
