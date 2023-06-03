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

vim.keymap.set("n", "<leader>s",
               [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Scuffed when copying some special chars
vim.keymap.set("v", "<leader>s",
               "y<Esc>:%s/<C-r><C-o>\"/<C-r><C-o>\"/gI<Left><Left><Left>")

vim.opt.list = true
vim.opt.listchars:append "tab:<->"
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.keymap.set("n", "<C-j>", "j<C-e>")
vim.keymap.set("n", "<C-k>", "k<C-y>")

-- Debugging
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F1>", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F2>", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F3>", "<cmd>lua require'dap'.step_out()<CR>")

vim.keymap
    .set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>ui", "<cmd>lua require('dapui').toggle()<CR>")

-- not sure if i am ever going to use these
-- but dont think these are used by anything else
-- Go to tab by number
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", ":tablast<cr>")
