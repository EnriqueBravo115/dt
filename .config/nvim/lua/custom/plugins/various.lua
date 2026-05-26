return {
  {
    "catgoose/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end
  },
  { "mbbill/undotree",              cmd = "UndotreeToggle" },
  { "HiPhish/rainbow-delimiters.nvim", event = { "BufReadPost", "BufNewFile" } },
  { "tpope/vim-fugitive",           cmd = { "G", "Git", "Gdiff", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" } },
  { "tpope/vim-surround",           event = { "BufReadPost", "BufNewFile" } },
  { "mfussenegger/nvim-jdtls",      ft = "java" },
  { "ThePrimeagen/harpoon",         keys = { "<leader>a", "<C-e>", "<C-h>", "<C-t>", "<C-n>", "<C-s>" } },
}
