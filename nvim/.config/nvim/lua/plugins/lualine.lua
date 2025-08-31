function GetWordsOrLocation()
    if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
        if vim.fn.wordcount().visual_words == 1 then
            return tostring(vim.fn.wordcount().visual_words) .. " word"
        elseif not (vim.fn.wordcount().visual_words == nil) then
            return tostring(vim.fn.wordcount().visual_words) .. " words"
        else
            return tostring(vim.fn.wordcount().words) .. " words"
        end
    else
        local location = require("lualine.components.location")
        return location()
    end
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = "tokyonight",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { statusline = {}, winbar = {} },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                "branch",
                {
                    "diff",
                    diff_color = {
                        -- Same color values as the general color option can be used here.
                        added = { fg = "#90ee90" }, -- Changes the diff's added color
                        modified = { fg = "#f0e130" }, -- Changes the diff's modified color
                        removed = { fg = "#ff0038" }, -- Changes the diff's removed color you
                    },
                    symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
                },
                {
                    "diagnostics",
                    symbols = { error = "E", warn = "W", info = "I", hint = "H" },
                },
            },
            lualine_c = { { "filename", path = 1 } },
            lualine_x = { "progress" },
            lualine_y = { "filetype" },
            lualine_z = { "GetWordsOrLocation()" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "nvim-dap-ui", "quickfix" },
    },
}
