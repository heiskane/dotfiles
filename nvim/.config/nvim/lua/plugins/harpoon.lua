return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "fg", function() require("harpoon"):list():add() end, mode = "n" },
        { "fv", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, mode = "n" },
        { "ma", function() require("harpoon"):list():select(1) end, mode = "n" },
        { "ms", function() require("harpoon"):list():select(2) end, mode = "n" },
        { "md", function() require("harpoon"):list():select(3) end, mode = "n" },
        { "mf", function() require("harpoon"):list():select(4) end, mode = "n" },
        { "mg", function() require("harpoon"):list():select(5) end, mode = "n" },
    },
    config = function() require("harpoon"):setup() end,
}
