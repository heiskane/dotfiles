call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'navarasu/onedark.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ThePrimeagen/harpoon'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" Set relative numbers
set nu rnu 

colorscheme onedark

lua << EOF
require('coc')
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
--vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})


local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
vim.keymap.set('n', 'fg', harpoon_mark.add_file, {})
vim.keymap.set('n', 'fv', harpoon_ui.toggle_quick_menu, {})

vim.opt.list = true
vim.opt.listchars:append "tab:<->"
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

EOF
