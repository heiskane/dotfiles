local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({set_lsp_keymaps = {omit = {'<F2>'}}})

lsp.ensure_installed({'eslint', 'rust_analyzer', 'pyright'})

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>op", vim.diagnostic.open_float)
    vim.keymap.set("n", 'dn', vim.diagnostic.goto_next)
    vim.keymap.set("n", 'dp', vim.diagnostic.goto_prev)

    vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
end)

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true
})
