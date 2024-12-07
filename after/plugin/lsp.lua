vim.filetype.add({ extension = { templ = "templ" } })
local lspconfig = require("lspconfig")

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "C:/Users/exsjabe/AppData/Local/nvim-data/mason/bin/gopls.CMD" },
  filetypes = { "go", "gomod", "gowork", "gotmpl", "templ" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.rust_analyzer.setup({
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = "clippy"
      },
      cargo = {
        allFeatures = true,
        -- Toggle specific features:
        features = { "all" }
      },
      procMacro = {
        enable = true
      },
      -- Add more settings as needed
    }
  }
})

-- lspconfig.tailwindcss.setup({
--   filetypes = vim.list_extend(
--     require('lspconfig.server_configurations.tailwindcss').default_config.filetypes or {},
--     { "rust" }
--   ),
--   settings = require('lspconfig.server_configurations.tailwindcss').default_config.settings
-- })


lspconfig.sourcekit.setup {}
local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
  "eslint",
  "rust_analyzer",
})
lsp.configure('sourcekit', { force_setup = true })




local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-Space>'] = cmp.mapping.complete(),
  ["<CR>"] = cmp.mapping.confirm({
    -- this is the important line
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  }),
  ["<Tab>"] = vim.schedule_wrap(function(fallback)
    if cmp.visible() and has_words_before() then
      cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    else
      fallback()
    end
  end),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
    -- Copilot Source
    { name = "copilot",  group_index = 2 },
    -- Other Sources
    { name = "nvim_lsp", group_index = 2 },
    { name = "path",     group_index = 2 },
  },
})

lsp.set_preferences({
  suggest_lsp_servers = false,
})

local function disallow_format(servers)
  return function(client)
    local contains = vim.tbl_contains(servers, client.name) == false;
    return contains;
  end
end

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"
lsp.on_attach(function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    local allow_format = disallow_format({ "tsserver", "eslint", "ts_ls" })
    vim.keymap.set("n", "<C-f>", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), filter = allow_format, timeout_ms = 10000 })
    end, { buffer = bufnr, desc = "[lsp] format" })
    -- format on save
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          async = async,
          filter = allow_format,
          timeout_ms = 10000
        })
      end,
      desc = "[lsp] format on save",
    })
  end

  if client.supports_method("textDocument/rangeFormatting") then
    vim.keymap.set("x", "<C-f>", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), filter = allow_format, timeout_ms = 10000 })
    end, { buffer = bufnr, desc = "[lsp] format" })
  end

  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({
      async = false,
      timeout_ms = 10000,
      filter = disallow_format({ "tsserver", "eslint", "ts_ls" }),
    })
  end, opts)

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)
lsp.setup();

vim.diagnostic.config({
  virtual_text = true
})
