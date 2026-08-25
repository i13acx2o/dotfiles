-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Navigate diagnostics
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Diagnostics next" })

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Diagnostics prev" })

-- Toggle zoom for the current buffer
vim.keymap.set("n", "<leader>z", function()
  require("mini.misc").zoom()
end, { desc = "toggle zoom" })

-- Toggle markdown preview
vim.keymap.set("n", "<leader>p", "<CMD>Markview<CR>", { desc = "Toggle markdown preview" })
