return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			-- debug = true,
			sources = {
				-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins
				null_ls.builtins.formatting.stylua,
				-- TS/JS
				require("none-ls.diagnostics.eslint").with({
					prefer_local = "node_modules/.bin",
				}),
				require("none-ls.code_actions.eslint").with({
					prefer_local = "node_modules/.bin",
				}),
				require("none-ls.formatting.eslint").with({
					prefer_local = "node_modules/.bin",
				}),
				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				-- Terraform
				null_ls.builtins.formatting.terraform_fmt,
				null_ls.builtins.diagnostics.terraform_validate,
			},
		})
	end,
}
