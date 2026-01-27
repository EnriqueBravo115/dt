vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

local home = os.getenv("HOME")
local jdtls = require("jdtls")

local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

local workspace_folder = home .. "/.cache/jdtls/workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local config = {
  capabilities = capabilities,
  settings = {
    flags = {
      allow_incremental_sync = true,
    },
    java = {
      configuration = {
        runtimes = {
          {
            name = "Java-25",
            path = "/home/nullboy/.sdkman/candidates/java/25.0.1-tem/"
          },
        },
        updateBuildConfiguration = "interactive",
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      completion = {
        favoriteStaticMembers = {
          -- "org.hamcrest.MatcherAssert.assertThat",
          -- "org.hamcrest.Matchers.*",
          -- "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
          "java.util.stream.Collectors.*",
          "java.util.Comparator.*",
          "java.util.Map.entry",
          "org.assertj.core.api.Assertions.*"
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*", "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      test = {
        enabled = true,
      },
    },
  },

  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. home .. "/.config/lombok.jar",
    "-jar",
    vim.fn.glob(
      "/home/nullboy/.config/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration", "/home/nullboy/.config/jdtls/config_linux/",
    "-data", workspace_folder,
  },
}

config["on_attach"] = function(client, bufnr)
end

jdtls.start_or_attach(config)
