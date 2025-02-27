return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
        lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			}) -- lua
			lspconfig.ts_ls.setup({

				capabilities = capabilities,
			}) -- TypeScript/JavaScript
			lspconfig.pyright.setup({

				capabilities = capabilities,
			}) -- Python
			lspconfig.ltex.setup({

				capabilities = capabilities,
			}) -- Latex
			lspconfig.rust_analyzer.setup({

				capabilities = capabilities,
			}) -- Rust
			lspconfig.clangd.setup({

				capabilities = capabilities,
			}) -- C/C++
			lspconfig.intelephense.setup({

				capabilities = capabilities,
			}) -- PHP/Laravel
			lspconfig.sqlls.setup({

				capabilities = capabilities,
			}) -- SQL
			lspconfig.yamlls.setup({

				capabilities = capabilities,
			}) -- YAML
			lspconfig.jdtls.setup({

				capabilities = capabilities,
			}) -- Java
			lspconfig.ast_grep.setup({

				capabilities = capabilities,
			}) -- Dart/Flutter
			lspconfig.kotlin_language_server.setup({

				capabilities = capabilities,
			}) -- Kotlin
			lspconfig.gopls.setup({

				capabilities = capabilities,
			}) -- Go
			lspconfig.marksman.setup({

				capabilities = capabilities,
			}) -- Markdown
			lspconfig.cssls.setup({

				capabilities = capabilities,
			}) -- CSS
			lspconfig.html.setup({

				capabilities = capabilities,
			}) -- HTML
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
