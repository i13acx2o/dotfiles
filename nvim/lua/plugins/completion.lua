return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "onsails/lspkind.nvim", -- show kinds in completion menu
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noselect",
      },

      window = {
        completion = cmp.config.window.bordered({
          border = "single",
          scrollbar = false,
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          border = "single",
          scrollbar = false,
          winhighlight = "Normal:CmpDocumentation,FloatBorder:CmpDocumentation",
        }),
      },

      formatting = {
        format = require("lspkind").cmp_format({
          mode = "text",
          menu = {
            nvim_lsp = "[LSP]",
            path = "[Path]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
          },
        }),
      },

      -- Completion sources
      sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer", keyword_length = 3 },
      },

      -- Enable luasnip to handle snippet expansion for nvim-cmp
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Completion keymaps
      mapping = cmp.mapping.preset.insert({
        -- confirm completion
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- abort completion
        ["<C-e>"] = cmp.mapping.abort(),

        -- scroll up and down the documentation window
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        -- Jump to the next snippet placeholder
        ["<C-f>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Jump to the previous snippet placeholder
        ["<C-b>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
    })

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
