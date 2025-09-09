vim.opt.guicursor = ""
vim.opt.colorcolumn = "120"
vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.cmd [[colorscheme solarized-osaka]]
vim.cmd("highlight NvimTreeIndentMarker guifg=#fd9353")
vim.cmd("highlight MatchParen guibg=#09F7A0 guifg=#000000")
vim.cmd("highlight ColorColumn guibg=#1c1c24")
