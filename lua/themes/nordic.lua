-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understanding properties, fields, and what highlightings the color used for
---@type Base46Table
local M = {}
-- UI
M.base_30 = {
  white = "#C0C8D8",
  black = "#242933", -- usually your theme bg
  darker_black = "#1E222A", -- 6% darker than black
  black2 = "#3B4252", -- 6% lighter than black
  one_bg = "#434C5E", -- 10% lighter than black
  one_bg2 = "#4C566A", -- 6% lighter than one_bg2
  one_bg3 = "#576073", -- 6% lighter than one_bg3
  grey = "#454952", -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = "#898C91", -- 10% lighter than grey
  grey_fg2 = "#83858B", -- 5% lighter than grey
  light_grey = "#4C566A",
  red = "#B74E58",
  baby_pink = "#C5727A",
  pink = "#BE9DB8",
  line = "#454952", -- 15% lighter than black
  green = "#97B67C",
  vibrant_green = "#B1C89D",
  nord_blue = "#5E81AC",
  blue = "#81A1C1",
  seablue = "#88C0D0",
  yellow = "#E7C173", -- 8% lighter than yellow
  sun = "#EFD49F",
  purple = "#B48EAD",
  dark_purple = "#A97EA1",
  teal = "#2D7A8A",
  orange = "#CB775D",
  cyan = "#80B3B2",
  statusline_bg = "#191D24",
  lightbg = "#2E3440",
  pmenu_bg = "#97B67C",
  folder_bg = "#81A1C1",
}

-- check https://github.com/chriskempson/base16/blob/master/styling.md for more info
M.base_16 = {
  base00 = "#242933",
  base01 = "#60728A",
  base02 = "#576073",
  base03 = "#7C7F85",
  base04 = "#60728A",
  base05 = "#BBC3D4",
  base06 = "#c7cdd8",
  base07 = "#C0C8D8",
  base08 = "#B74E58",
  base09 = "#C5727A",
  base0A = "#E7C173",
  base0B = "#A3BE8C",
  base0C = "#88C0D0",
  base0D = "#81A1C1",
  base0E = "#B48EAD",
  base0F = "#B74E58",
}

-- OPTIONAL
-- overriding or adding highlights for this specific theme only
-- defaults/treesitter is the filename i.e integration there,

M.polish_hl = {
  defaults = {
    Comment = {
      italic = true,
    },
  },
}

-- set the theme type whether is dark or light
M.type = "dark" -- "or light"

-- this will be later used for users to override your theme table from chadrc
return M
