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
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local on_attach = function(client, bufnr)
        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
      end

      -- TypeScript/JavaScript
      -- Note: no workspace-diagnostics on_attach here. This is a large
      -- monorepo (400+ TS/JS files) and workspace-diagnostics.nvim force-opens
      -- every matching git-tracked file against the single ts_ls client on
      -- attach, regardless of package boundaries. That floods tsserver's
      -- request queue and makes interactive completion unreliable (multi-
      -- minute stalls, or empty results once it gives up). Diagnostics for
      -- files you actually open still work normally via didOpen/didChange.
      vim.lsp.config("ts_ls", {
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = capabilities,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        -- Root at the nearest package (tsconfig.json/package.json), not the
        -- monorepo root, so the server resolves each package's own
        -- node_modules/typescript instead of falling back to Mason's bundled
        -- version when no `typescript` package exists at the workspace root.
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local root = vim.fs.root(fname, { "tsconfig.json", "jsconfig.json", "package.json" })
            or vim.fs.root(fname, { ".git" })
          on_dir(root)
        end,
      })

      -- ESLint LSP
      -- Only overriding capabilities here; nvim-lspconfig's built-in default
      -- for eslint already does per-package monorepo root detection (finds
      -- the nearest eslint.config.js/.eslintrc relative to the buffer) and
      -- flat-config support, which is more correct than hand-rolling it. No
      -- on_attach/workspace-diagnostics here for the same reason as ts_ls.
      vim.lsp.config("eslint", {
        capabilities = capabilities,
      })

      -- Fix all auto-fixable ESLint problems on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
        callback = function(args)
          local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "eslint" })
          if #clients > 0 then
            vim.cmd("LspEslintFixAll")
          end
        end,
      })

      -- JSON
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
      })

      -- YAML
      vim.lsp.config("yamlls", {
        capabilities = capabilities,
      })

      -- Docker
      vim.lsp.config("dockerls", {
        capabilities = capabilities,
      })

      -- Lua
      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".git" },
      })

      -- CSS/SCSS/LESS
      vim.lsp.config("cssls", {
        cmd = { "vscode-css-language-server", "--stdio" },
        capabilities = capabilities,
        filetypes = { "css", "scss", "less" },
        root_markers = { "package.json", ".git" },
        init_options = { provideFormatter = true },
        settings = {
          css = { validate = true },
          scss = { validate = true },
          less = { validate = true },
        },
      })

      -- Enable the servers
      vim.lsp.enable({ "ts_ls", "lua_ls", "cssls", "eslint", "jsonls", "yamlls", "dockerls" })
    end,
  },
}
