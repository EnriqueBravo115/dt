local Colors = {
  black1      = "#000000",
  black2      = "#262626",
  yellow1     = "#d9b263",
  yellow2     = "#e3c78a",
  violet      = "#ae81ff",
  git         = "#393b44",
  filename    = "#9e9e9e",
  red         = "#ff8170",
  blue        = "#78c2b3",
  transparent = "#00FFFFFF"
}

local custom = {
  normal = {
    a = { fg = Colors.black1, bg = Colors.blue, gui = "bold" },
    b = { fg = Colors.yellow2, bg = Colors.git },
    c = { fg = Colors.filename, bg = Colors.transparent },
  },
  insert = { a = { fg = Colors.black1, bg = Colors.red, gui = "bold" }, },
  visual = { a = { fg = Colors.black1, bg = Colors.violet, gui = "bold" } },
  command = { a = { fg = Colors.black1, bg = Colors.yellow1, gui = "bold" } },
  inactive = {
    a = { fg = Colors.black2, bg = Colors.transparent, gui = "bold" },
    b = { fg = Colors.black2, bg = Colors.transparent },
    c = { bg = Colors.transparent, fg = Colors.git },
  },
}

require("lualine").setup {
  options = {
    theme = custom,
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
        unix = '特', -- e712
        dos = '', -- e70f
        mac = '', -- e711
      } },
    },
    lualine_z = {
      { "location" }
    }
  },
}
