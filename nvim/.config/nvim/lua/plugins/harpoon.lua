return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "fg", function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", "fv", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "ma", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "ms", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "md", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "mf", function()
            harpoon:list():select(4)
        end)
    end,
}
