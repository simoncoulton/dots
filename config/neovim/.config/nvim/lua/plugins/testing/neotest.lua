return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "thenbe/neotest-playwright",
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest"
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-playwright").adapter({
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        }),
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
        ["neotest-vitest"] = {}
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
    })
  end,
  keys = {
    {
      "<leader>tc",
      function()
        require("neotest").run.run()
      end,
      desc = "[T]est [C]urrent File",
    },
  },
}
