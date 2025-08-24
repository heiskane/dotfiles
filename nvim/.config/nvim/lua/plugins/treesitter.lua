return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
        ensure_installed = {
            "python",
            "elixir",
            "html",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
            "lua",
        },
        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            -- additional_vim_regex_highlighting = false,
        },
    },
}
