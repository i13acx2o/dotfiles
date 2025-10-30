return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  keys = {
    {
      -- Find files
      ";f",
      function()
        require("telescope.builtin").find_files({ no_ignore = false, hidden = false })
      end,
      desc = "Telescope: Files",
    },

    {
      -- Live grep
      ";r",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Telescope: Live grep",
    },

    {
      -- Grep string
      ";w",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Telescope: Grep String",
    },

    {
      -- Diagnostics
      ";d",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Telescope: Diagnostics",
    },

    {
      -- List buffers
      ";b",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Telescope: Buffers",
    },

    {
      -- Resume last picker
      ";;",
      function()
        require("telescope.builtin").resume()
      end,
      desc = "Telescope: Resume",
    },
  },

  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.8,
          preview_width = 0.6,
          preview_cutoff = 0,
        },
      },
    })
    require("telescope").load_extension("fzf")
  end,
}
