vim.o.rnu = true
vim.o.swf = false

vim.o.sm = true
vim.o.hls = false

vim.o.et = true
vim.o.sr = true
vim.o.sw = 4
vim.o.ts = 4
vim.o.sts = 4

require("vim._core.ui2").enable()
vim.o.winborder = "rounded"
vim.o.ch = 0

vim.o.confirm = true
vim.diagnostic.config({ virtual_lines = true })

vim.cmd.packadd("nvim.undotree")
vim.pack.add({
  "https://github.com/catppuccin/nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/saghen/blink.lib",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/akinsho/toggleterm.nvim",
  "https://github.com/OXY2DEV/markview.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  float = { transparent = true, solid = false },
  auto_integrations = true
})
vim.cmd.colorscheme("catppuccin-nvim")

require("mini.basics").setup()

require("mini.files").setup({
  windows = { preview = true, width_preview = 50 },
})
vim.keymap.set("n", "<leader>fs", function()
  require("mini.files").open()
end, { desc = "Navigate [F]ile [S]ystem" })

require("mini.pick").setup()
require("mini.extra").setup()
require("mini.icons").setup()
local pickers = require("mini.pick").builtin
vim.keymap.set("n", "<leader>ff", pickers.files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fb", pickers.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fg", pickers.grep_live, { desc = "[F]ind by [G]rip" })
vim.keymap.set("n", "<leader>fh", pickers.help, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fr", pickers.resume, { desc = "[F]ind [R]esume" })

require("mini.indentscope").setup({ symbol = "│", })

require("mini.hipatterns").setup({
  highlighters = {
    -- Highlight standalone 'FIX', 'HACK', 'TODO', 'NOTE'
    fix       = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFixme' },
    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
  },
})

require("mini.splitjoin").setup()
require("mini.surround").setup()
require("mini.git").setup()

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "gopls" }
})

require("blink.cmp").build():wait(6000)
require("blink.cmp").setup({
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true, show_with_menu = true }
  },
  fuzzy = { implementation = "rust" }
})

require("nvim-autopairs").setup()

require("lualine").setup({
  options = { section_separators = { "|", "|" }, component_separators = { "" }, },
  sections = {
    lualine_x = {},
    lualine_y = { "location", "filetype" },
    lualine_z = { { "datetime", style = "%H:%M" } }
  }
})

require("toggleterm").setup({
  open_mapping = [[<C-q>]],
  direction = "float",
  float_opts = { border = "curved", width = 120, height = 30 },
})

require("markview").setup({
  preview = { icon_provider = "mini" },
})

require("nvim-treesitter")
