return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      show_dirname = false,
      show_basename = true,
      symbols = {
        separator = "",
      },
    },
    config = function(_, opts)
      require("barbecue").setup(opts)

      local function transparent()
        vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE" })
        for _, group in ipairs(vim.fn.getcompletion("barbecue_", "highlight")) do
          local hl = vim.api.nvim_get_hl(0, { name = group })
          hl.bg = nil
          vim.api.nvim_set_hl(0, group, hl)
        end
      end

      transparent()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = transparent })
    end,
  }
}
