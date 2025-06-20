return {
  "lewis6991/gitsigns.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("gitsigns").setup {
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "│" },
        topdelete    = { text = "-" },
        changedelete = { text = "~" },
        untracked    = { text = "?" },
      },
    }
  end,
}
