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

  -- Fancy UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = { enabled = false },
      },
      cmdline = {
        enabled = true,
        view = "cmdline",
      },
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
