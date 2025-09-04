return {
    { "tpope/vim-surround", event = { "VeryLazy" } },
    { "airblade/vim-gitgutter", event = { "VeryLazy" } },
    { "j-hui/fidget.nvim", opts = {} },
    { "mason-org/mason.nvim", opts = {} },
    { "windwp/nvim-autopairs", opts = {}, event = { "VeryLazy" } },
    {
        "kosayoda/nvim-lightbulb",
        event = { "VeryLazy" },
        opts = { autocmd = { enabled = true } },
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        dependencies = { "folke/twilight.nvim" },
    },
    {
        "tpope/vim-dadbod",
        dependencies = { "kristijanhusak/vim-dadbod-ui" },
        cmd = "DBUI",
    },
    {
        "mbbill/undotree",
        opts = {},
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, mode = "n" },
        },
    },
}
