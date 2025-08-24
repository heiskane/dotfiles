return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "black" },
            -- You can customize some of the format options for the filetype (:help conform.format)
            rust = { "rustfmt", lsp_format = "fallback" },
            -- Conform will run the first available formatter
            javascript = { "prettierd", "prettier", stop_after_first = true },
        },
        formatters = {
            stylua = {
                args = { "--indent-type", "Spaces", "--stdin-filepath", "$FILENAME", "-" },
            },
        },
    },
    format_on_save = false,
    keys = {
        { "<leader>fo", function() require("conform").format() end, mode = "n", desc = "Format file" },
    },
}
