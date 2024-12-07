local function is_biome_active()
  -- Check if Biome LSP is attached to current buffer
  local active_clients = vim.lsp.get_active_clients({ bufnr = 0 })
  local has_biome = false

  for _, client in pairs(active_clients) do
    if client.name == "biome" then
      has_biome = true

      break
    end
  end



  -- Check for biome.json in root directory
  local root_dir = vim.fn.getcwd()
  local biome_config = root_dir .. "/biome.json"
  local has_biome_config = vim.fn.filereadable(biome_config) == 1

  return has_biome or has_biome_config
end



-- Example usage:

if is_biome_active() == false then
  local prettier = require("prettier")
  prettier.setup({
    bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },
  })
end
