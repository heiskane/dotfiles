local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', 'fg', mark.add_file, {})
vim.keymap.set('n', 'fv', ui.toggle_quick_menu, {})

vim.keymap.set("n", "na", function() ui.nav_file(1) end)
vim.keymap.set("n", "ns", function() ui.nav_file(2) end)
vim.keymap.set("n", "nd", function() ui.nav_file(3) end)
vim.keymap.set("n", "nf", function() ui.nav_file(4) end)
