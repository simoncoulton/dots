vim.keymap.set("n", "<leader>lg", function()
  require("lazygit").open()
end, { desc = "Lazygit (float)" })

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  end,
})