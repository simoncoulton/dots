local capabilities = require("config.lsp.capabilities")

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
})

vim.lsp.enable({"lua_ls"})