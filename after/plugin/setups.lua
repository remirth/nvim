tree = require('nvim-tree')
tree.setup()

require('trouble').setup()
require('refactoring').setup({})

require('nvim-lightbulb').setup({autocmd = {enabled = true}})
