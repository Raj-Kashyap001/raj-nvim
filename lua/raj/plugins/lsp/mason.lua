return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- list of servers for mason to install
    mason_lspconfig.setup({
      ensure_installed = {
        "pyright",
        "bashls",
        "clangd",
        "biome"
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "biome",
        "prettier", -- prettier formatter
        "black",    -- python formatter
        "pylint",
      },
    })
  end,
}
