return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  event = "BufReadPre",
  opts = {
    ensure_installed = {
      "lua",
      "go",
    },
    highlight = { enable = true },
    indent = { enable = true },
    autopairs = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
