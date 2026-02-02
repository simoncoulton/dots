vim.lsp.config("terraformls", {})
vim.lsp.enable({"terraformls"})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = function()
		vim.lsp.buf.format()
	end,
})
