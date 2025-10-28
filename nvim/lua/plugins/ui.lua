return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "BufRead",

    opts = {
      options = {
        component_separators = { "|", "|" },
        section_separators = { "" },
      },
      sections = {
        lualine_x = {},
        lualine_y = { "location" },
        lualine_z = { "filetype" },
      },
    },
  },

  -- Fancy notifications
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      background_colour = "#000000",
      fps = 60,
      render = "compact",
    },
  },

  -- Visual color highlights
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    config = true,
  },

  -- Git tracking signs
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = true,
  },

  -- Indentation visuals
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "mason",
          "lazy",
          "toggleterm",
        },
      },
    },
  },

  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "BufReadPre",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "lazy",
          "mason",
          "toggleterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
        desc = "Disable mini indent scope",
      })
    end,
  },
}
