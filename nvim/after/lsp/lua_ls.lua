return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      hint = {
        enable = false,
        semicolon = "Disable",
        setType = true,
      },
    },
  },
}
