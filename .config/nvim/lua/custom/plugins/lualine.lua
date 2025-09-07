return {
  "nvim-lualine/lualine.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("lualine").setup {
      options = {
        theme = "auto",
        component_separators = "",
        section_separators = { left = "", right = "" },
        always_divide_middle = false,
        refresh = {
          statusline = 50,
          tabline = 50,
          winbar = 50,
        }
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "󰘬" }, },
        lualine_c = { { "filename" }, { "diff", symbols = { added = "󰋠 ", modified = "󱗜 ", removed = "󰍵 " } } },
        lualine_x = { "diagnostics" },
        lualine_y = {
          { "fileformat", symbols = {
            unix = '', -- e712
            dos = '', -- e70f
            mac = '', -- e711
          } },
        },
        lualine_z = {
          { "location" }
        }
      },
    }
  end,
}
