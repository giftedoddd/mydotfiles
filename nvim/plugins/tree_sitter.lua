return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
  },
  {
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
  },
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  version = false, -- use latest commit
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/playground",
  },
  opts = {
    ensure_installed = {
      "bash",
      "comment",
      "css",
      "csv",
      "dart",
      "dockerfile",
      "html",
      "java",
      "json5",
      "lua",
      "markdown",
      "meson",
      "nginx",
      "python",
      "regex",
      "rust",
      "toml",
      "c",
      "markdown_inline",
      "cpp",
    },
    sync_install = false,
    auto_install = true,
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
