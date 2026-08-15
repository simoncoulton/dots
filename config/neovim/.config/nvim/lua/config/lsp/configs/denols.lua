local capabilities = require("config.lsp.capabilities")
local utils = require("config.lsp.utils")
local lspconfig = require("lspconfig")

-- Only enable denols in Deno projects
vim.lsp.config("denols", {
	capabilities = capabilities,
	root_dir = function(fname)
		if not utils.is_deno(fname) then
			return nil
		end
		return lspconfig.util.root_pattern("deno.json", "deno.jsonc")(fname)
	end,
	single_file_support = false,
	init_options = {
		lint = true,
		unstable = true,
		suggest = {
			imports = {
				hosts = {
					["https://deno.land"] = true,
					["https://cdn.nest.land"] = true,
					["https://crux.land"] = true,
				},
			},
		},
	},
})

vim.lsp.enable({ "denols" })
