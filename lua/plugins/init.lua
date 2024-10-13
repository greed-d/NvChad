return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = require("configs.telescope").keys,
  },

  {
    "Theprimeagen/harpoon",
    config = true,
    keys = require "configs.harpoon",
  },

  {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
    opts = require "configs.cord",
  },

  { "mfussenegger/nvim-jdtls", ft = "java", config = function() end },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {},
    keymaps = {
      ["<C-h>"] = false,
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "nvim-lualine/lualine.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "greed-d/lualine-so-fancy.nvim",
    },

    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        vim.o.statusline = " "
      else
        vim.o.laststatus = 0
      end
    end,

    config = function()
      return require "configs.lualine"
    end,
  },

  {
    "folke/flash.nvim",
    opts = {},
  -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = function()
      require("live-server").setup(opts)
    end,
  },

  {
    "toppair/peek.nvim",
    ft = "markdown",
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    branch = "v3.x",
    cmd = { "Neotree toggle" },
    opts = {
      window = {
        position = "right",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",

      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },

  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require "configs.tmux-navigation"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local conf = require "nvchad.configs.cmp"
      conf.mapping = require("configs.cmp").mapping
      return conf
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    "utilyre/barbecue.nvim",
    event = "LspAttach",
    name = "barbecue",
    enabled = true,
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      config = true,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "java",
        "python",
        "html",
        "css",
      },
    },
  },
}
