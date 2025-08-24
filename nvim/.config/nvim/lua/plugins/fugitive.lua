return {
    "tpope/vim-fugitive",
    cmd = { "Git" },
    keys = {
        { "<leader>gi", "<cmd>vertical Git<cr>", mode = "n" },
        { "<leader>gl", "<cmd>vertical Git log --pretty=format:'%h %as %an %s'<CR>", mode = "n" },
    },
}
