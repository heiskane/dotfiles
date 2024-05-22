-- https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({ "stevearc/dressing.nvim" })

	use({ "kosayoda/nvim-lightbulb" })

	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate",
		opts = { ensure_installed = { "vimdoc", "python", "markdown", "markdown_inline", "bash" } },
	})
	use("nvim-treesitter/playground")
	use("nvim-treesitter/nvim-treesitter-context")

	use("theprimeagen/harpoon")
	use("ThePrimeagen/git-worktree.nvim")
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")

	use("mbbill/undotree")

	use("github/copilot.vim")

	use({ "numToStr/Comment.nvim" })

	use("https://codeberg.org/esensar/nvim-dev-container")

	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

	use("mg979/vim-visual-multi")
	use("mhartington/formatter.nvim")

	use("nvim-neotest/nvim-nio")
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python")

	use("lvimuser/lsp-inlayhints.nvim")

	use("lambdalisue/nerdfont.vim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use("christoomey/vim-tmux-navigator")

	use("ryanoasis/vim-devicons")

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use("rhysd/git-messenger.vim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" }, -- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" }, -- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Snippet Collection (Optional)
			{ "rafamadriz/friendly-snippets" },
			{ "j-hui/fidget.nvim" },
		},
	})

	use("folke/zen-mode.nvim")
	use("folke/twilight.nvim")

	use("airblade/vim-gitgutter")

	use("lukas-reineke/indent-blankline.nvim")

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
