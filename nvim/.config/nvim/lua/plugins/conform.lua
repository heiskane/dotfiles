return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format", "ruff_organize_imports" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            html = { "prettierd" },
            sql = { "pg_format" }
        },
        formatters = {
            stylua = {
                args = { "--indent-type", "Spaces", "--stdin-filepath", "$FILENAME", "-" },
            },
        },
    },
    format_on_save = false,
    keys = {
        {
            "<leader>fo",
            function()
                require("conform").format()
            end,
            mode = "n",
            desc = "Format file",
        },
    },
}
