return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        python = { "black" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>n", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { silent = true })
  end,
}
