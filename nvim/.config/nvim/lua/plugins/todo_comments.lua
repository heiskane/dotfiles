return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        highlight = {
            pattern = {
                [[.*(\@(KEYWORDS))\s*]], -- matches: @TODO  comment
                [[.*<((KEYWORDS)%(\(.{-1,}\))?)]], -- matches: TODO(potato): comment
                [[.*<(KEYWORDS)\s*]], -- matches: TODO: comment
            },
        },
        search = {
            pattern = [[\b(KEYWORDS):|@\b(KEYWORDS)|\b(KEYWORDS)(\(\w*\))*:]],
        },
    },
    keys = {
        { "<leader>to", "<cmd>TodoTelescope keywords=TODO,FIX<CR>", mode = "n" },
    },
    event = { "VeryLazy" },
}
