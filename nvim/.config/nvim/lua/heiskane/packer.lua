-- https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use {'nvim-telescope/telescope-ui-select.nvim' }
    use {'stevearc/dressing.nvim'}

    use { 'kosayoda/nvim-lightbulb' }

    use('folke/tokyonight.nvim')
    use {"catppuccin/nvim", as = "catppuccin"}

    use('nvim-treesitter/nvim-treesitter',
        {run = ':TSUpdate', opts = {ensure_installed = {"vimdoc"}}})
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')

    use('theprimeagen/harpoon')
    use('tpope/vim-surround')
    use('tpope/vim-fugitive')

    use('mbbill/undotree')

    use('github/copilot.vim')

    -- TODO: setup elsewhere
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    use('https://codeberg.org/esensar/nvim-dev-container')

    use {"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim"}

    use('mg979/vim-visual-multi')
    use('mhartington/formatter.nvim')

    use('mfussenegger/nvim-dap')
    use('rcarriga/nvim-dap-ui')
    use('mfussenegger/nvim-dap-python')

    use('lvimuser/lsp-inlayhints.nvim')

    use('lambdalisue/nerdfont.vim')

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use('christoomey/vim-tmux-navigator')

    use('ryanoasis/vim-devicons')

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end
    })

    use('rhysd/git-messenger.vim')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'}, -- Autocompletion
            {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'}, {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'}, -- Snippets
            {'L3MON4D3/LuaSnip'}, -- Snippet Collection (Optional)
            {'rafamadriz/friendly-snippets'}
        }
    }

    use('folke/zen-mode.nvim')
    use('folke/twilight.nvim')

    use('airblade/vim-gitgutter')

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then require('packer').sync() end
end)
