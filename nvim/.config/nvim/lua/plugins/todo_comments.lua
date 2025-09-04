return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        highlight = { pattern = { [[.*\@<(KEYWORDS)\s*]], [[.*<(KEYWORDS)\s*:]] } },
        search = { pattern = [[\b(KEYWORDS):|@\b(KEYWORDS)]] },
    },
    keys = {
        { "<leader>to", "<cmd>TodoTelescope keywords=TODO,FIX<CR>", mode = "n" },
    },
    event = { "BufEnter" },
}
