return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      -- 1. 最小 setup（新版不再放功能开关）
      require("nvim-treesitter").setup()

      -- 2. 安装 parser（替代 ensure_installed）
      require("nvim-treesitter").install({
        "lua",
        "vim",
        "vimdoc",

        "python",
        "go",
        "c",
        "cpp",

        "json",
        "yaml",
        "toml",

        "bash",
        "markdown",
        "markdown_inline",
      })
    end,
  },
}
