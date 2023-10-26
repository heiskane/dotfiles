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
            require("formatter.filetypes.python").isort,
            require("formatter.filetypes.python").black
        },
        java = {
            function()
                return {
                    exe = "clang-format",
                    args = {"--style=Google", "--assume-filename=.java"},
                    stdin = true
                }
            end
        },
        typescriptreact = {require("formatter.filetypes.typescript").prettier},
        javascript = {require("formatter.filetypes.javascript").prettier},
        sql = {function() return {exe = "sql-formatter", stdin = true} end},
        html = {require("formatter.filetypes.html").prettier},
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
        json = {require("formatter.filetypes.json").prettier},
        yaml = {require("formatter.filetypes.yaml").prettier},
        cpp = {require("formatter.filetypes.cpp").clangformat},
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}
