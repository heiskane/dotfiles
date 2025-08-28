return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 999 },
    { "rebelot/kanagawa.nvim", name = "kanagawa", priority = 998 },
    { "rose-pine/neovim", name = "rose-pine", priority = 997 },
    { "shaunsingh/nord.nvim", name = "nord", priority = 996 },
}
