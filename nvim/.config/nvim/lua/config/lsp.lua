vim.lsp.enable({
    "luals",
    "elixirls",
    "pyright",
    "ruff",
    "eslint",
    "postgresql",
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
