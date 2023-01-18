vim.api.nvim_create_autocmd("BufWritePost", {
    -- group = vim.api.nvim_create_augroup("AutoFormat", { clear = true}),
    callback = function()
        -- Wait for formatting to finish

        vim.cmd("FormatWrite")
    end
})
