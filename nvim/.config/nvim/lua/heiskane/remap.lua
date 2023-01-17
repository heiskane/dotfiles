vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", "<:m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", "<:m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Scuffed when copying some special chars
vim.keymap.set("v", "<leader>s", "y<Esc>:%s/<C-r><C-o>\"/<C-r><C-o>\"/gI<Left><Left><Left>")

vim.opt.list = true
vim.opt.listchars:append "tab:<->"
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.keymap.set("n", "<leader>op", vim.diagnostic.open_float)

vim.keymap.set("n", "<C-j>", "jzz")
vim.keymap.set("n", "<C-k>", "kzz")
