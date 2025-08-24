-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    -- All formatter configurations are opt-in
    filetype = {
        lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua
        },
        rust = {
            function()
                return
                    {exe = "rustfmt", stdin = true, args = {"--edition 2021"}}
            end
        },
        python = {
            require("formatter.filetypes.python").ruff,
            -- require("formatter.filetypes.python").isort,
            -- require("formatter.filetypes.python").black
        },
        elixir = {require("formatter.filetypes.elixir").mixformat},
        java = {
            function()
                return {
                    exe = "clang-format",
                    args = {"--style=Google", "--assume-filename=.java"},
                    stdin = true
                }
            end
        },
        typescriptreact = {require("formatter.filetypes.typescript").prettierd},
        typescript = {require("formatter.filetypes.typescript").prettierd},
        javascript = {require("formatter.filetypes.javascript").prettierd},
        sql = {function() return {exe = "sql-formatter", stdin = true} end},
        html = {require("formatter.filetypes.html").prettierd},
        -- TODO: use recently added default for xml
        xml = {
            function()
                return {
                    exe = "tidy",
                    args = {
                        "-quiet", "-xml", "--indent auto", "--indent-spaces 2",
                        "--vertical-space yes", "--tidy-mark no"
                    },
                    stdin = true,
                    try_node_exe = true
                }
            end
        },
        json = {require("formatter.filetypes.json").prettierd},
        yaml = {require("formatter.filetypes.yaml").prettierd},
        cpp = {require("formatter.filetypes.cpp").clangformat},
        css = {require("formatter.filetypes.css").prettierd},
        c = {require("formatter.filetypes.c").clangformat},
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}
