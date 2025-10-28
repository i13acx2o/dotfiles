-- Disable arrow keys
vim.keymap.set({ "n", "i", "v" }, "<Up>", "")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "")

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG")

-- Split window
vim.keymap.set("n", ";s", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", ";v", ":vsplit<CR>", { noremap = true, silent = true })

-- Resize window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

-- Copy/Paste system clipboard
vim.keymap.set({ "n", "x" }, "gy", '"+y')
vim.keymap.set("n", "gp", '"+p')
vim.keymap.set("x", "gp", '"+P')

-- J/K improved
vim.keymap.set("n", "j", [[v:count?"j":"gj"]], { noremap = true, expr = true })
vim.keymap.set("n", "k", [[v:count?"k":"gk"]], { noremap = true, expr = true })

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Diagnostics
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Diagnostics prev" })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Diagnostics next" })

vim.keymap.set({ "n", "i", "v", "t" }, "<C-q>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
