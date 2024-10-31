local M = {}

local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch "([^/]+)" do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

M.git = function()
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
    .. "%#St_gitIcons#"
    .. branch_name
    .. "%#GitSignsAdd#"
    .. added
    .. "%#GitSignsChange#"
    .. changed
    .. "%#GitSignsDelete#"
    .. removed
end

M.lsp = function()
  local clients = {}
  local buf = vim.api.nvim_get_current_buf()

  -- Iterate through all the clients for the current buffer
  for _, client in pairs(vim.lsp.get_clients { bufnr = buf }) do
    -- Add the client name to the `clients` table
    table.insert(clients, client.name)
  end

  local lint_ok, lint = pcall(require, "lint")
  if lint_ok then
    local linters = {}
    local fts = vim.split(vim.bo.filetype, ".", { plain = true, trimempty = true })
    for _, ft in pairs(fts) do
      vim.list_extend(linters, lint.linters_by_ft[ft] or {})
    end
    if #linters ~= 0 then
      table.insert(clients, table.concat(linters, ", "))
    end
  end

  local conform_ok, conform = pcall(require, "conform")
  if conform_ok then
    local formatters = conform.list_formatters(0)
    for _, formatter in pairs(formatters) do
      table.insert(clients, formatter.name)
    end
  end

  if #clients == 0 then
    return ""
  else
    return (vim.o.columns > 100 and (" %#St_Lsp#" .. "  LSP ~ " .. table.concat(clients, ", ") .. " "))
      or "%#St_Lsp#  LSP "
  end
end

M.cursor = function()
  local separators = {}
  local config = require("nvconfig").ui.statusline
  local theme = config.theme
  local sep_style = config.separator_style

  local mode = {
    default = {
      default = { left = "", right = "" },
      round = { left = "", right = "" },
      block = { left = "█", right = "█" },
      arrow = { left = "", right = "" },
    },
    minimal = {
      default = { left = "█", right = "█" },
      round = { left = "", right = "" },
      block = { left = "█", right = "█" },
      arrow = { left = "█", right = "█" },
    },
    vscode = {
      default = { left = "█", right = "█" },
      round = { left = "", right = "" },
      block = { left = "█", right = "█" },
      arrow = { left = "", right = "" },
    },
    vscode_colored = {
      default = { left = "█", right = "█" },
      round = { left = "", right = "" },
      block = { left = "█", right = "█" },
      arrow = { left = "", right = "" },
    },
  }

  separators = (type(sep_style) == "table" and sep_style) or mode[theme][sep_style]

  local sep_l = separators["left"]
  local sep_end = "%#St_sep_r#" .. separators["right"]
  local position = function()
    local line = vim.fn.line "."
    local last_line = vim.api.nvim_buf_line_count(0)
    local col = vim.fn.virtcol "."
    if line == 1 then
      return "Top"
    elseif line == last_line then
      return "Bottom"
    else
      return string.format("%d:%d", line, col)
    end
  end

  -- From: NvChad/ui
  local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
    return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_end
  end

  if theme == "default" then
    return "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon# %#St_pos_text# %p%% "
    -- return "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon# %#St_pos_text# " .. position() .. " "
  elseif theme == "vscode" or theme == "vscode_colored" then
    return "%#StText# %L"
  end
  return gen_block("", "%L", "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#")
end

M.python_venv = function()
  if vim.bo.filetype ~= "python" then
    return " "
  end

  local venv = get_venv "CONDA_DEFAULT_ENV" or get_venv "VIRTUAL_ENV" or " "
  if venv == " " then
    return " "
  else
    return "%#Statement#" .. " 󰆑 " .. venv
  end
end

M.macro = function()
  local recording = vim.fn.reg_recording() -- Check if a macro is being recorded
  if recording ~= "" then
    return "@" .. recording -- Return the register key where the macro is being recorded
  else
    return "" -- Return an empty string if no macro is being recorded
  end
end
return M
