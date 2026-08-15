return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
  -- config = function()
  --   require("lualine").setup({
  --     theme = "catppuccin",
  --   })
  -- end,
  config = function()
    require('lualine').setup({
      options = {
        theme = 'catppuccin',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {
          'branch', 
          'diff',
          { 
            'diagnostics',
            sources = { 'nvim_lsp', 'nvim_diagnostic' },
            sections = { 'error', 'warn', 'info', 'hint' },
            -- symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
      },
        lualine_c = {'filename'},
        lualine_x = {
          {
            'diagnostics',
            sources = {'nvim_workspace_diagnostic' },
            sections = { 'error', 'warn', 'info', 'hint' },
            -- symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
          'encoding',
          'fileformat',
          'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    })
  end,
}
