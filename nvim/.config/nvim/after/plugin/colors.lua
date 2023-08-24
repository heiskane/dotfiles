require("tokyonight").setup({style = "night"})
require("catppuccin").setup({flavour = "mocha"})

function ColorMyStuff(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)
end

ColorMyStuff()
