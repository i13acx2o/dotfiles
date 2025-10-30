return {
  -- Supermaven
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    config = true,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    opts = {
      -- open_mapping = [[<C-q>]],
      direction = "float",
      float_opts = {
        border = "curved",
        width = 80,
        height = 20,
      },
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      hide_numbers = true,
    },
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done()),
      })
    end,
  },

  -- Quick comments
  {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
    config = true,
  },

  -- Fancy TODOs
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufReadPre",
    cmd = "TodoTelescope",
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { ";t", "<cmd>TodoTelescope<cr>", desc = "Telescope: Todo" },
    },
    opts = {},
  },

  -- Treesitter
  {
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
  },
}
