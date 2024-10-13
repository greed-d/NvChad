-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = true,
}

M.lsp = {
  signature = false,
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

M.ui = {
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    separator_style = "round",
    -- separator_style = {
    --   sep_l = "",
    --   sep_r = "",
    -- },
    order = nil,
    modules = {
      git = function()
        local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        if not vim.b[stbufnr].gitsigns_head or vim.b[stbufnr].gitsigns_git_status then
          return ""
        end

        local git_status = vim.b[stbufnr].gitsigns_status_dict

        local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
        local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
        local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
        local branch_name = " " .. git_status.head

        return " "
          .. "%#DevIconYaml#"
          .. branch_name
          .. "%#GitSignsAdd#"
          .. added
          .. "%#GitSignsChange#"
          .. changed
          .. "%#GitSignsDelete#"
          .. removed
      end,
    },
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
}

return M
