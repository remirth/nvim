local null_ls = require("null-ls")
local null_ls_h = require("null-ls.helpers")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local allow_format = function(client) return client.name ~= "tsserver" end
null_ls.setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<C-f>", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), filter = allow_format, timeout_ms = 10000 })
            end, { buffer = bufnr, desc = "[lsp] format" })

            -- format on save
            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
            vim.api.nvim_create_autocmd(event, {
                buffer = bufnr,
                group = group,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = async, filter = allow_format, timeout_ms = 10000 })
                end,
                desc = "[lsp] format on save",
            })
        end

        if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<C-f>", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), filter = allow_format, timeout_ms = 10000 })
            end, { buffer = bufnr, desc = "[lsp] format" })
        end
    end,
})
