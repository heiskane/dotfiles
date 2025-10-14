return {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gwip", "Gtag" },
    keys = {
        { "<leader>gi", "<cmd>vertical Git<cr>", mode = "n" },
        { "<leader>gl", "<cmd>vertical Git log --pretty=format:'%h %as %an %s'<CR>", mode = "n" },
    },
    config = function()
        vim.api.nvim_create_user_command("Gwip", function()
            vim.cmd([[Git add --all]])
            vim.cmd(string.format("Git commit -m '(wip): %s'", os.date("%Y-%m-%dT%H:%M")))
        end, { desc = "Create a `work_in_progress` commit" })

        vim.api.nvim_create_user_command("Gtag", function(params)
            vim.cmd(string.format("Git tag %s'", params.args))
            vim.cmd(string.format("Git push origin tag %s'", params.args))
        end, { desc = "Create git tag and push to origin", nargs = 1 })
    end,
}
