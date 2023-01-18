vim.api.nvim_create_autocmd("BufWritePost", {
    -- group = vim.api.nvim_create_augroup("AutoFormat", { clear = true}),
    pattern = "*.rs",
    callback = function()
        -- Wait for formatting to finish
        vim.fn.jobwait({vim.fn.jobstart({"cargo", "fmt"})}, 60000)

        -- Force refresh
        vim.cmd.checktime()
    end
})
