local builtin = require("telescope.builtin")
local set = vim.keymap.set
local opts = { noremap = true, silent = true }
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>r", "<cmd>:MarkdownPreview<CR>")
vim.keymap.set("n", "<leader>ww", "<cmd>:w<CR>")
vim.keymap.set("n", "<leader>qq", "<cmd>:q<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>:G push<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>:tabnew<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>:tabnext<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
set("n", "<leader>as", vim.diagnostic.setloclist)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<C-t>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-h>", "<cmd>cprev<CR>zz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //3<CR>")

-- Telescope
vim.keymap.set("n", "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({previewer=false}))<cr>", opts)
vim.keymap.set("n", "<leader>fo",
  "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_ivy({previewer=false}))<cr>", opts)
vim.keymap.set("n", "<leader>fg",
  "<cmd>lua require'telescope.builtin'.git_files(require('telescope.themes').get_ivy({previewer=false}))<cr>", opts)
vim.keymap.set("n", "<leader>bf",
  "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({previewer=false}))<cr>", opts)
vim.keymap.set("n", '<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)
vim.keymap.set("n", '<leader>vh', builtin.help_tags, {})

-- Harpoon
vim.keymap.set("n", "<C-s>", mark.add_file)
vim.keymap.set("n", "<C-f>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)

-- Exit from window
vim.api.nvim_exec([[tnoremap <esc><esc> <C-\><C-n>:wincmd w<CR> ]], false)

-- Color line yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Enviar el comando al REPL de Clojure conectado
vim.api.nvim_create_user_command(
  "ResetComponentRepl",
  function()
    vim.cmd("ConjureEval (in-ns \'dev)")
    vim.cmd("ConjureEval (component-repl/reset)")
  end,
  { desc = "Reset component REPL in dev namespace" }
)
