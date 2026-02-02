local capabilities = require("config.lsps.capabilities")

local capabilities = require("config.lsps.capabilities")

vim.lsp.config("denols", {
	capabilities = capabilities,
})

vim.lsp.enable({"denols"})