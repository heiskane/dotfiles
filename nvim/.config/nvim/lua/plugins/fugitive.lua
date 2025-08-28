return {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gwip" },
    keys = {
        { "<leader>gi", "<cmd>vertical Git<cr>", mode = "n" },
        { "<leader>gl", "<cmd>vertical Git log --pretty=format:'%h %as %an %s'<CR>", mode = "n" },
    },
    config = function()
        vim.api.nvim_create_user_command("Gwip", function()
            vim.cmd([[Git add --all]])
            vim.cmd(string.format("Git commit -m '(wip): %s'", os.date("%Y-%m-%dT%H:%M")))
        end, {
            desc = "Create a `work_in_progress` commit",
        })
    end,
}
