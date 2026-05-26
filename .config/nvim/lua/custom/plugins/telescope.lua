return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    require('telescope').setup({})
  end
}
