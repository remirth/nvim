
  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  servers = {'pyright', 'tsserver', 'angularls', 'vls', 'gopls', 'html', 'cssls', 'eslint', 'powershell_es'}
  for _, server in pairs(servers) do
      require('lspconfig')[server].setup {
          capabilities = capabilities
      }
    end
