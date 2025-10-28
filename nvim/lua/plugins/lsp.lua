return {
  -- LSP Setup (general for any LSP)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          -- Enable inlay hints
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
          end

          -- Keymaps for LSP
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({ border = "rounded", max_width = 80 })
          end, opts)
          vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
          end, opts)
          vim.keymap.set("n", "gD", function()
            vim.lsp.buf.declaration()
          end, opts)
          vim.keymap.set("n", "gi", function()
            vim.lsp.buf.implementation()
          end, opts)
          vim.keymap.set("n", "go", function()
            vim.lsp.buf.type_definition()
          end, opts)
          vim.keymap.set("n", "gr", function()
            vim.lsp.buf.references()
          end, opts)
          vim.keymap.set("n", "gs", function()
            vim.lsp.buf.signature_help()
          end, opts)
          vim.keymap.set("n", "<F2>", function()
            vim.lsp.buf.rename()
          end, opts)
          vim.keymap.set({ "n", "x" }, "<F3>", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
          vim.keymap.set("n", "<F4>", function()
            vim.lsp.buf.code_action()
          end, opts)
        end,
      })

      local lspconfig_defaults = require("lspconfig").util.default_config
      lspconfig_defaults.capabilities =
        vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls" },
        automatic_enable = true,
      })

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },

  -- Mason plugin to install LSPs automatically
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },
}
