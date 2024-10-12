local options = {
  options = {
    theme = "catppuccin-mocha",
    component_separators = { right = "", left = "" },
    section_separators = { right = "", left = "" },
    globalstatus = true,
    refresh = {
      statusline = 100,
    },
  },
  sections = {
    lualine_a = {
      { "fancy_mode", separator = { left = "", right = "" }, right_padding = 2 },
    },
    lualine_b = {
      function()
        local file = vim.fn.expand "%:t"
        local extension = vim.fn.expand "%:e"
        local icon = require("nvim-web-devicons").get_icon(file, extension)
        return icon .. " " .. file
      end,
      -- separator = { left = '', right = ''}
    },
    lualine_c = {
      { "fancy_branch", icon = "" },
      {
        "fancy_diff",
        symbols = { added = " ", modified = " ", removed = " " }, -- Changes the symbols used by the diff.
        colored = true,
      },
    },
    lualine_x = {
      {
        "fancy_diagnostics",
        -- diagnostics_color = {
        --   error = { fg = '#ee6d85' },
        -- },
        symbols = { error = " ", warn = " ", info = "󰋼 ", hint = "󰛩 " },
      },
      { "fancy_lsp_servers" },
    },
    lualine_y = {
      { "fancy_macro", separator = { left = "", right = "" } },

      { "fancy_searchcount", separator = { left = "", right = "" } },
      {
        "fancy_location",
        separator = { left = "" },
      },
      -- separator = { left = ''}
    },
    lualine_z = {
      { "fancy_cwd", fg = "", bg = "#474853", separator = { left = "", right = "" } },

      -- function()
      --   local cwd = vim.fn.getcwd()
      --   return '󰉖 ' .. (cwd:match '([^/\\]+)[/\\]*$' or cwd)
      -- end,
    },
  },
}

return options
