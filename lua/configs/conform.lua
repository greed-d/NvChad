local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    json = { "fixjson" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    python = { "black" },
    bash = { "shfmt" },
    nix = { "nixfmt" },
    java = { "checkstyle", "google-java-format" },
  },

  format_on_save = {
    -- timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
