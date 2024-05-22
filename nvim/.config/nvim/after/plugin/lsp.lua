local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

require("fidget").setup()

lsp.preset("recommended")

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({
		buffer = bufnr,
		exclude = { "<F2>" },
	})

	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>op", vim.diagnostic.open_float)
	vim.keymap.set("n", "dn", vim.diagnostic.goto_next)
	vim.keymap.set("n", "dp", vim.diagnostic.goto_prev)

	vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "markdown_oxide" },
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({})
		end,
		html = function()
			lspconfig.html.setup({})
			lspconfig.htmx.setup({})
		end,
		markdown_oxide = function()
			-- An example nvim-lspconfig capabilities setting
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			-- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
			-- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
			capabilities.workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = true,
				},
			}

			lspconfig.markdown_oxide.setup({
				capabilities = capabilities, -- again, ensure that capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
				on_attach = function()
					-- TODO: add markdown keybinds?
				end, -- configure your on attach config
			})
		end,
	},
})
