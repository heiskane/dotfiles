require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night"
})

function ColorMyStuff(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)
end

ColorMyStuff()

