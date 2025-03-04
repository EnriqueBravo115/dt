return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- GENERAL
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  --use "jiangmiao/auto-pairs"
  use "tpope/vim-fugitive"
  use "vimwiki/vimwiki"
  use "lewis6991/gitsigns.nvim"
  use "theprimeagen/harpoon"
  use "mbbill/undotree"
  use "nvim-lualine/lualine.nvim"
  use "stevearc/dressing.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "mfussenegger/nvim-jdtls"
  use "lukas-reineke/indent-blankline.nvim"
  use({ "nvim-telescope/telescope.nvim", tag = "0.1.8", requires = { { "nvim-lua/plenary.nvim" } } })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use "rebelot/kanagawa.nvim"

  use { "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- DAP
  use "nvim-telescope/telescope-dap.nvim"
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
  use "folke/neodev.nvim"
  use "leoluz/nvim-dap-go"

  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      { "neovim/nvim-lspconfig" },
      {
        "williamboman/mason.nvim",
        run = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/cmp-nvim-lua" },
    }
  }
end)
