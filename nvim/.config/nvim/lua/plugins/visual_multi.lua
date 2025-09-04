return {
    "mg979/vim-visual-multi",
    event = { "VeryLazy" },
    config = function()
        -- https://vi.stackexchange.com/a/6855
        -- Without this blink.cmp breaks after using visual-multi mode
        vim.api.nvim_create_autocmd("User", {
            pattern = "visual_multi_exit",
            callback = function()
                local cmp = require("blink.cmp")

                -- TODO: Find a better way of fixing visual_multi breaking blink
                vim.keymap.set("i", "<CR>", function()
                    if cmp.is_visible() then
                        cmp.accept()
                        return ""
                    else
                        return vim.api.nvim_replace_termcodes("<CR>", true, false, true)
                    end
                end, { expr = true, silent = true })

                vim.keymap.set("i", "<Up>", function()
                    if cmp.is_visible() then
                        cmp.select_prev()
                        return ""
                    else
                        return vim.api.nvim_replace_termcodes("<Up>", true, false, false)
                    end
                end, { expr = true, silent = true })

                vim.keymap.set("i", "<Down>", function()
                    if cmp.is_visible() then
                        cmp.select_next()
                        return ""
                    else
                        return vim.api.nvim_replace_termcodes("<Down>", true, false, false)
                    end
                end, { expr = true, silent = true })
            end,
        })
    end,
}
