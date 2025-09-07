return {
  "mbbill/undotree",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "mfussenegger/nvim-jdtls",
  "norcalli/nvim-colorizer.lua",
  "ThePrimeagen/harpoon",
  config = function()
    require("colorizer").setup()
  end
}
