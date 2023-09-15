vim.opt.nu = true
vim.opt.relativenumber = true

-- netrw relative line numbers
vim.g.netrw_bufsettings = "noma nomod nonu nobl nowrap ro rnu"

-- allow copying to parent dir.
-- nevermind because this breaks other functionality
-- like searching files
-- vim.g.netrw_keepdir = 0

-- 30% window size when split
vim.g.netrw_winsize = 30

-- allow copying directories
vim.g.netrw_localcopydircmd = 'cp -r'

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
