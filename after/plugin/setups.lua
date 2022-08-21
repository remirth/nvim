tree = require('nvim-tree')
tree.setup()

require('trouble').setup()
require('refactoring').setup({})

require('nvim-lightbulb').setup({autocmd = {enabled = true}})
require('hover').setup{
      init = function()
        -- Require providers
        require('hover.providers.lsp')
        require('hover.providers.gh')
        -- require('hover.providers.man')
        require('hover.providers.dictionary')
      end,
      preview_opts = {
        border = nil
      },
      title = true
    }

    -- Setup keymaps
    vim.keymap.set('n',  '<leader>k', require('hover').hover       , { desc='hover.nvim'         })
    vim.keymap.set('n', '<leader>gk', require('hover').hover_select, { desc='hover.nvim (select)' })
