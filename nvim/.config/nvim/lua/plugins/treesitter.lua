return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            install_max_wait = 300000, -- wait max. 5min to install
            ensure_installed = {
                "python",
                "elixir",
                "html",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "lua",
                "yaml",
            },
            exclude_ft = {
                "qf",
                "oil",
                "git",
                "lazy",
                "mason",
                "fidget",
                "harpoon",
                "fugitive",
                "gitcommit",
                "oil_preview",
                "lazy_backdrop",
                "blink-cmp-menu",
                "TelescopePrompt",
                "TelescopeResults",
            },
            ft_lang = {
                htmlangular = "html",
            },
        },
        config = function(_, opts)
            require("nvim-treesitter").install(opts.ensure_installed):wait(opts.install_max_wait)

            for ft, lang in pairs(opts.ft_lang) do
                vim.treesitter.language.register(lang, { ft })
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "*" },
                callback = function(event)
                    if vim.tbl_contains(opts.exclude_ft, event.match) then
                        return
                    else
                        -- treesitter will fail to start if it is missing the language (eg. oil)
                        if not pcall(vim.treesitter.start) then
                            vim.notify(
                                "treesitter failed to start for filetype: " .. vim.inspect(event.match),
                                vim.log.levels.WARN
                            )
                        end
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            multiwindow = false, -- Enable multiwindow support.
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- Maximum number of lines to show for a single context
            trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
            zindex = 20, -- The Z-index of the context window
            on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        },
    },
}
