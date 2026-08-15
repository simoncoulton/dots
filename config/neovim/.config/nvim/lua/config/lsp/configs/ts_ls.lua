local capabilities = require("config.lsp.capabilities")
local utils = require("config.lsp.utils")
local lspconfig = require("lspconfig")

-- Only enable ts_ls if NOT in a Deno project
vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	on_attach = function(client, bufnr)
		require("workspace-diagnostics").populate_workspace_diagnostics(client, 0);
	end,
	-- root_dir = function(fname)
	-- 	-- Don't start ts_ls in Deno projects
	-- 	if utils.is_deno(fname) then
	-- 		return nil
	-- 	end
	-- 	return lspconfig.util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
	-- end,
	single_file_support = false,
})

vim.lsp.enable("ts_ls")
