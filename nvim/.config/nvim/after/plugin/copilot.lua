vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<A-C-k>", 'copilot#Accept("<CR>")',
                        {silent = true, expr = true})
