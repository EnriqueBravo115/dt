-- rest.nvim se instala SIN su rockspec: el rock tree-sitter-http falla al compilar
-- (el parser `http` ya lo provee nvim-treesitter). Las dependencias Lua puras
-- (xml2lua, mimetypes) se instalan con luarocks en un árbol local.
local rocks_tree = vim.fn.stdpath "data" .. "/rest-rocks"

return {
  "rest-nvim/rest.nvim",
  ft = { "http" },
  cmd = { "Rest" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",
    "j-hui/fidget.nvim",
  },
  build = function()
    for _, rock in ipairs { "xml2lua", "mimetypes" } do
      vim.system({ "luarocks", "install", "--lua-version=5.1", "--tree", rocks_tree, rock }):wait()
    end
  end,
  init = function()
    local share = rocks_tree .. "/share/lua/5.1"
    package.path = package.path .. ";" .. share .. "/?.lua;" .. share .. "/?/init.lua"

    vim.g.rest_nvim = {
      request = {
        skip_ssl_verification = false,
      },
      response = {
        hooks = {
          decode_url = true,
          format = true, -- usa formatprg del filetype (json -> jq, ver ftplugin/json.lua)
        },
      },
      ui = {
        winbar = true,
        keybinds = {
          prev = "H",
          next = "L",
        },
      },
    }
  end,
  keys = {
    { "<leader>Rs", "<cmd>horizontal aboveleft Rest run<cr>", desc = "Send request" },
    { "<leader>Rl", "<cmd>horizontal aboveleft Rest last<cr>", desc = "Re-run last request" },
    { "<leader>Ro", "<cmd>horizontal aboveleft Rest open<cr>", desc = "Open result pane" },
    { "<leader>Re", "<cmd>Rest env select<cr>", desc = "Select .env file" },
    { "<leader>RL", "<cmd>Rest logs<cr>", desc = "Open logs" },
  },
}
