-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            timeout = 50,
        })
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),

    callback = function(args)
        local opts = { buffer = args.buf, remap = false }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>op", vim.diagnostic.open_float)
        vim.keymap.set("n", "dn", vim.diagnostic.goto_next)
        vim.keymap.set("n", "dp", vim.diagnostic.goto_prev)

        vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set(
            "n",
            "<leader>fr",
            require("telescope.builtin").lsp_references,
            { noremap = true, silent = true }
        )
    end,
})
