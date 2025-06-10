return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        dim_inactive_windows = false,
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
        enable = {
          terminal = false,
          legacy_highlights = false,
          migrations = true,
        },
      })
    end,
  },
}
