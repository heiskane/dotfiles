require("nvim-treesitter.configs").setup({
	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

require("nvim-treesitter").define_modules({
	treesitter_context = {
		attach = function(_, _)
			vim.cmd("TSContextEnable")
		end,
		detach = function(_, _)
			vim.cmd("TSContextDisable")
		end,
	},
})
