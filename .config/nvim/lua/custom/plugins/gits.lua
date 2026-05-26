return {
  "lewis6991/gitsigns.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup {
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "-" },
        topdelete    = { text = "-" },
        changedelete = { text = "~" },
        untracked    = { text = "?" },
      },
    }
  end,
}
