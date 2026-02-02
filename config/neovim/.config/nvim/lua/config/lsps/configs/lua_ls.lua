local capabilities = require("config.lsps.capabilities")

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
})

vim.lsp.enable({"lua_ls"})