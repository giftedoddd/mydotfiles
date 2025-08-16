return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  event = "InsertEnter", -- or Lazy-load on UI enter
  opts = {
    keymap = {
      preset = "default",
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = {
        auto_show = false,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = {
      implementation = "lua",
    },
  },
  opts_extend = { "sources.default" },
}
