return {
    { "tpope/vim-surround" },
    { "airblade/vim-gitgutter" },
    { "j-hui/fidget.nvim", opts = {} },
    { "mason-org/mason.nvim", opts = {} },
    { "windwp/nvim-autopairs", opts = {} },
    {
        "kosayoda/nvim-lightbulb",
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
