return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
        highlight = { enable = true },
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
    },
  ---@param opts TSConfig
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
