require("nvchad.configs.lspconfig").defaults()
local configs = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  awk_ls = {},
  bashls = {},

  clangd = {},
  cssls = {},
  ruff = {},
  eslint = {},
  -- jdtls = {},
  kotlin_language_server = {},
  ts_ls = {},
  emmet_ls = {},
  taplo = {},

  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
}

-- require("java").setup()

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
