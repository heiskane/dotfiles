require("tokyonight").setup({style = "night"})
require("catppuccin").setup({flavour = "mocha"})

function ColorMyStuff(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
end

ColorMyStuff()
