return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,

  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      auto_integrations = true,
      float = { transparent = true },
      show_end_of_buffer = true,
    })
    vim.cmd("colorscheme catppuccin")

    -- Completion menu highlight overrides for Catppuccin Mocha
    local colors = require("catppuccin.palettes").get_palette("mocha")

    -- Resets the transparency of the completion menu
    vim.opt.pumblend = 5
    vim.opt.winblend = 0

    -- Popup background and selected item
    vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.base, fg = colors.text })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.surface2, fg = colors.text, bold = true })

    -- Match text in completion (what matches your typed text)
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.sapphire, bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = colors.sapphire, bold = true })

    -- Item abbreviation and menu text
    vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = colors.text })
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = colors.overlay0, strikethrough = true })

    -- Item kinds (types of completion items)
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = colors.mauve })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = colors.mauve })
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = colors.peach })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = colors.pink })
    vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = colors.teal })
    vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = colors.blue })
    vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = colors.lavender })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = colors.flamingo })

    -- Subtle menu separator
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.surface1 })

    -- Documentation window background and text
    vim.api.nvim_set_hl(0, "CmpDocumentation", { bg = colors.base, fg = colors.text })
    vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { bg = colors.base, fg = colors.surface0 })
  end,
}
