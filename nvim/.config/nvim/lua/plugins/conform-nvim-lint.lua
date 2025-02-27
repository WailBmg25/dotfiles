-- init.lua or plugins setup with lazy.nvim
return {
	-- nvim-lint for diagnostics
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint_d" }, -- Replacing eslint_d
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				python = { "flake8" },
				rust = { "bacon" },
				c = { "cpplint" },
				php = { "phpcs" },
				sql = { "sqlfluff" },
				dart = { "dcm" },
				kotlin = { "ktlint" },
				go = { "golangci_lint" },
				markdown = { "markdownlint" },
				css = { "stylelint" },
				scss = { "stylelint" },
				html = { "htmlhint" },
				lua = { "luacheck" },
				java = { "checkstyle" },
				json = { "jsonlint" },
				sh = { "shellcheck" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	-- conform.nvim for formatting
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			conform.formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				python = { "black" },
				latex = { "latexindent" },
				rust = { "rustfmt" },
				c = { "clang_format" },
				php = { "phpcbf" },
				sql = { "sql_formatter" },
				yaml = { "yamlfix" },
				dart = { "dcm" },
				kotlin = { "ktlint" },
				go = { "gofumpt" },
				markdown = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },
				lua = { "stylua" },
				java = { "google_java_format" },
				json = { "prettier" },
				sh = { "shfmt" },
			}
			vim.keymap.set("n", "<leader>gf", function()
				conform.format({ lsp_fallback = true })
			end, { desc = "Format buffer" })
		end,
	},
}
