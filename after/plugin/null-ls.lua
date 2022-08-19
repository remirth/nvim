local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  print('null_ls not found, skipping null_ls plugin')
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettierd,
    diagnostics.luacheck,
    diagnostics.eslint,
    diagnostics.golangci_lint,
    diagnostics.jsonlint,
    diagnostics.codespell,
    formatting.stylelint,
    formatting.gofmt,
    formatting.fixjson,
    formatting.rustfmt,
    code_actions.eslint_d,
    code_actions.refactoring
  },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})

