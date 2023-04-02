local prettier = require("prettier")

File_Types = {
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
}

prettier.setup({
    bin = 'prettierd',
    filetypes = File_Types,
    cli_options = {
        config_precedence = "prefer-file",
    },
})
