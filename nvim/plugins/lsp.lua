return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Fidget (LSP status)
    require("fidget").setup({})

    -- Mason setup
    require("mason").setup({ PATH = "append" })

    -- Mason-LSPconfig setup
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "bashls",
        "clangd",
        "css_variables",
        "cssls",
        "cssmodules_ls",
        "dockerls",
        "docker_compose_language_service",
        "html",
        "htmx",
        "jdtls",
        "jedi_language_server",
        "lua_ls",
        "marksman",
        "nginx_language_server",
        "jsonls",
        "lemminx",
        "pylyzer",
        "pyre",
        "pyright",
        "ruff",
        "rust_analyzer",
        "typos_lsp",
        "yamlls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        -- Custom handler for zls
        ["zls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.zls.setup({
            root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
            settings = {
              zls = {
                enable_inlay_hints = true,
                enable_snippets = true,
                warn_style = true,
              },
            },
          })
          vim.g.zig_fmt_parse_errors = 0
          vim.g.zig_fmt_autosave = 0
        end,

        -- Custom handler for lua_ls
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                },
              },
            },
          })
        end,
      },
    })

    -- LSP diagnostics config
    vim.diagnostic.config({
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end,
}
