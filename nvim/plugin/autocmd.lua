-- Set local indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "config" },
  callback = function()
    vim.bo.sw = 2
    vim.bo.ts = 2
    vim.bo.sts = 2
  end,
})

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "txt", "md" },
  callback = function()
    vim.opt.spell = true
    vim.opt.spelllang = "en"
  end,
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

-- Start treesitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function() pcall(vim.treesitter.start) end,
})

-- Trigger format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function() pcall(vim.lsp.buf.format, { async = false }) end,
})

-- Set LSP hover window options
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({ max_width = 90, max_height = 20 })
    end, { desc = "LSP hover", buffer = args.buf })
  end,
})

-- Set format keymap
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    -- Format keymap
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]SP [F]ormat" })

    -- Toggle inlay hints
    vim.keymap.set("n", "<leader>lh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "[L]SP Inlay[H]ints" })
  end,
})
