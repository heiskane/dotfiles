local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', function()
-- 	builtin.grep_string({ search = vim.fn.input("grep: ") });
-- end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
