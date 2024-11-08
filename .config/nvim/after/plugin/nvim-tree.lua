require("nvim-tree").setup({
  view = {
    adaptive_size = true,
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = ""
        },
        git = {
          staged = "+",
          untracked = "?",
          unstaged = "-",
          ignored = "x",
        }
      }
    }
  }
})

vim.cmd("highlight NvimTreeIndentMarker guifg=#fd9353")
