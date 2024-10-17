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

M.ui = {
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },

  telescope = { style = "bordered" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    separator_style = "default",
    order = { "mode", "file", "python_venv", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "cwd" },
    modules = {
      git = require("configs.ui.statusline.components").git,
      lsp = require("configs.ui.statusline.components").lsp,
      cursor = require("configs.ui.statusline.components").cursor,
      python_venv = require("configs.ui.statusline.components").python_venv,
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
