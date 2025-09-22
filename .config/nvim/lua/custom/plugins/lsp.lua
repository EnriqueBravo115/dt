return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        vim.keymap.set("n", "<leader>n", function() vim.lsp.buf.format() end, opts)
      end,
    })

    local signs = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
    }

    vim.diagnostic.config({
      signs = {
        text = signs
      },
      virtual_text = false,
    })

    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
      },
    })

    lspconfig.emmet_language_server.setup({
      capabilities = capabilities,
      filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "typescriptreact",
      },
      init_options = {
        includeLanguages = {},
        excludeLanguages = {},
        extensionsPath = {},
        preferences = {},
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = "always",
        showSuggestionsAsSnippets = false,
        syntaxProfiles = {},
        variables = {},
      },
    })

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      root_dir = function(fname)
        local util = lspconfig.util
        return not util.root_pattern("deno.json", "deno.jsonc")(fname)
            and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
      end,
      single_file_support = false,
      init_options = {
        preferences = {
          includeCompletionsWithSnippetText = true,
          includeCompletionsForImportStatements = true,
        },
      },
    })

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      root_dir = function(fname)
        local util = lspconfig.util
        return not util.root_pattern('deno.json', 'deno.jsonc')(fname)
            and util.root_pattern('tsconfig.json', 'package.json', 'jsconfig.json', '.git')(fname)
      end,
      single_file_support = false,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
      init_options = {
        preferences = {
          includeCompletionsWithSnippetText = true,
          includeCompletionsForImportStatements = true,
        },
      },
    })

    lspconfig.gopls.setup({ capabilities = capabilities })
    lspconfig.clojure_lsp.setup({ capabilities = capabilities })
    lspconfig.lemminx.setup({ capabilities = capabilities })
  end,
}
