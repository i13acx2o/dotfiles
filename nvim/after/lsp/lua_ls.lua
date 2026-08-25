return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      workspace = { library = vim.api.nvim_get_runtime_file("lua", true) },
      runtime = {
        version = "LuaJIT",
      },
      hint = {
        enable = false,
        semicolon = "Disable",
        setType = true,
      },
    },
  },
}
