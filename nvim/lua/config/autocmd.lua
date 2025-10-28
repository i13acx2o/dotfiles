-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
  end,
  desc = "Highlight on yank",
})

-- Press q to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "checkhealth", "qf", "help", "man", "lspinfo" },
  callback = function()
    vim.keymap.set("n", "q", ":close<Return>", { noremap = true, silent = true })
  end,
  desc = "Press q to close",
})

-- Set local indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "config" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
  desc = "Set local indentation",
})

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "txt", "md" },
  callback = function()
    vim.opt.spell = true
    vim.opt.spelllang = "en"
  end,
  desc = "Set language spell",
})

-- Set cursor to last position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "gitcommit" and vim.bo.filetype ~= "help" then
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end
  end,
})
