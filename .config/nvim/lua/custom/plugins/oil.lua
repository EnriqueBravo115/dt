return {
  "stevearc/oil.nvim",
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  cmd = "Oil",
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
  },
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true
      }
    })
  end
}
