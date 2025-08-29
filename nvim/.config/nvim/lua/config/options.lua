vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.autoread = true
-- vim.opt.colorcolumn = "80"

-- configure split orientation
vim.opt.splitright = true
vim.opt.splitbelow = true

-- show whitespace chars
vim.opt.list = true
vim.opt.listchars:append("tab:──→")
vim.opt.listchars:append("trail:\\uff65")
vim.opt.listchars:append("space:\\uff65")
vim.opt.listchars:append("leadmultispace:\\uff65\\uff65\\uff65\\u2e3e")
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("nbsp:%")

vim.g.have_nerd_font = true

-- better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- window border
vim.opt.winborder = "bold"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Enable break indent
vim.o.breakindent = true

-- Show which line your cursor is on
vim.o.cursorline = true
