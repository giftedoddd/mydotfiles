return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    background = {
      light = "mocha",
      dark = "mocha",
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = { "italic" },
      booleans = { "italic" },
    },
    default_integrations = true,
    integrations = {},
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    -- Optional: Set bufferline highlights if bufferline is active
    local ok, bufferline = pcall(require, "bufferline")
    if ok and (vim.g.colors_name or ""):find("catppuccin") then
      bufferline.setup({
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      })
    end

    -- Apply the colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}
