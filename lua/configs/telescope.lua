local M = {}

M.keys = {
  { "<leader>sj", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[S]earch [K]eymaps" },
  { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
  { "<leader>ss", "<cmd>Telescope builtin<cr>", desc = "[S]earch [S]elect Telescope" },
  { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord" },
  { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
  { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
  { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "[S]earch [R]esume" },
  { "<leader>s.", "<cmd>Telescope oldfiles<cr>", desc = '[S]earch Recent Files ("." for repeat)' },
  { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "[ ] Find existing buffers" },
  {
    "<leader>/",
    function()
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end,
    desc = "[/] Fuzzily search in current buffer",
  },
  {
    "<leader>s/",
    function()
      require("telescope.builtin").live_grep {
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      }
    end,
    desc = "[S]earch [/] in Open Files",
  },
  {
    "<leader>sn",
    function()
      require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
    end,
    desc = "[S]earch [N]eovim files",
  },
}

return M
