local capabilities = require("config.lsps.capabilities")

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
	on_attach = function(client, bufnr)
		local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
		if filetype ~= "typescript" and filetype ~= "typescriptreact" and filetype ~= "typescript.tsx" then
			-- This is a hack to prevent TS running on .js & .jsx files
			-- even when it is configured not to.
			client.stop()
		end
	end,
})

vim.lsp.enable({"ts_ls"})