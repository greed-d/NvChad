require "nvchad.mappings"
local map = vim.keymap.set
local nomap = {
  "<leader>ff",
  "<leader>fw",
  "<leader>fb",
  "<leader>fh",
  "<leader>ma",
  "<leader>fo",
  "<leader>fz",
  "<leader>x",
  "<leader>b",
  "<C-n>",
  "<C-h>",
  "<C-j>",
  "<C-k>",
  "<C-l>",
}

vim.keymap.del("i", "<C-l>")

for _, v in ipairs(nomap) do
  vim.keymap.del("n", v)
end

-- [[ Core Keymaps ]]
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
map({ "n", "v", "x" }, "<S-h>", "^", { desc = "Move to front of line" })
map({ "n", "v", "x" }, "<S-l>", "$", { desc = "Move to end of line" })
map({ "n", "v" }, "<", "<gv", { desc = "Move indent left once" })
map({ "n", "v" }, ">", ">gv", { desc = "Move indent left once" })
map({ "n", "v", "t", "x" }, "<A-,>", "<C-w><", { desc = "Decrease window size" })
map({ "n", "v", "t", "x" }, "<A-.>", "<C-w>>", { desc = "Move indent left once" })
map({ "n", "v", "x" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
map({ "n", "v", "x" }, "<leader>Y", '"+yy', { noremap = true, silent = true, desc = "Yank line to clipboard" })
map({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "v", "n" }, "<", "<gv")
map({ "v", "n" }, ">", ">gv")
map("x", "p", 'p:let @"=@0<CR>', { silent = true })

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

map("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Toggle [O]il" })
map("n", "<leader>bk", "<cmd>bdelete<CR>", { desc = "close buffers" })
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "close buffers" })

map({ "n", "v", "t" }, "\\", "<cmd>Neotree toggle<CR>", { desc = "Toggle neo-tree" })

map("n", "<A-b>", function()
  require("nvchad.floaterm").open {
    w = 0.4,
    h = 0.4,

    terms = {
      {
        name = "fetch",
        cmd = "fastfetch",
      },
    },
  }
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
