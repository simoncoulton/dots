local installed = require("config.lsp.installed")

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "artemave/workspace-diagnostics.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = installed,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
      },
      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = {
          auto_show = true,
        },

        list = {
          selection = {
            preselect = false,
          },
        },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local on_attach = function(client, bufnr)
        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
      end

      -- TypeScript/JavaScript
      vim.lsp.config("ts_ls", {
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        root_markers = { "tsconfig.json", "package.json", ".git" },
      })

      -- ESLint LSP
      -- vim.lsp.config('eslint', {
      --   cmd = { 'vscode-eslint-language-server', '--stdio' },
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      --   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      --   root_markers = { ".eslintrc.js", ".eslintrc.json", ".eslintrc", "eslint.config.js", "package.json" },
      --   settings = {
      --     workingDirectories = { mode = "auto" },
      --   },
      -- })

      -- Lua
      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".git" },
      })

      -- Enable the servers
      vim.lsp.enable({ "ts_ls", "lua_ls" })
    end,
  },
}
