-- Numbers
vim.opt.number = true
vim.opt.rnu = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- History
vim.opt.undofile = true
vim.opt.backup = false

-- Swap
vim.opt.swapfile = false

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Status
vim.opt.showmode = false
vim.opt.cmdheight = 0

-- Search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.showmatch = true

-- Word wrap
vim.opt.wrap = true

-- Scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Popup
vim.opt.pumheight = 10

-- Spaces
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Mouse support
vim.opt.mouse = "a"

-- Colors
vim.opt.termguicolors = true

-- Show chars
vim.opt.list = true
vim.opt.listchars = "tab:>.,eol:↲"

-- Signatures
vim.opt.signcolumn = "yes"

-- Misc
vim.opt.hidden = true
vim.opt.virtualedit = "block"
vim.opt.wildignore:append({ "*.pyc", "**/.git/*" })
vim.opt.path:append("**")
vim.opt.shortmess:append("c")
