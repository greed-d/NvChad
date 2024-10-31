return {
  --[[
  
  ▗▖    ▗▄▄▖▗▄▄▖      ▗▄▖ ▗▖  ▗▖▗▄▄▄     ▗▖ ▗▖▗▄▄▄▖ ▗▄▄▖▗▖ ▗▖▗▖   ▗▄▄▄▖ ▗▄▄▖▗▖ ▗▖▗▄▄▄▖▗▄▄▖
  ▐▌   ▐▌   ▐▌ ▐▌    ▐▌ ▐▌▐▛▚▖▐▌▐▌  █    ▐▌ ▐▌  █  ▐▌   ▐▌ ▐▌▐▌     █  ▐▌   ▐▌ ▐▌  █ ▐▌   
  ▐▌    ▝▀▚▖▐▛▀▘     ▐▛▀▜▌▐▌ ▝▜▌▐▌  █    ▐▛▀▜▌  █  ▐▌▝▜▌▐▛▀▜▌▐▌     █  ▐▌▝▜▌▐▛▀▜▌  █  ▝▀▚▖
  ▐▙▄▄▖▗▄▄▞▘▐▌       ▐▌ ▐▌▐▌  ▐▌▐▙▄▄▀    ▐▌ ▐▌▗▄█▄▖▝▚▄▞▘▐▌ ▐▌▐▙▄▄▖▗▄█▄▖▝▚▄▞▘▐▌ ▐▌  █ ▗▄▄▞▘

  --]]
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
    -- dev = true,
  },

  { "mfussenegger/nvim-jdtls", ft = "java", config = function() end },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local conf = require "nvchad.configs.cmp"
      conf.mapping = require("configs.cmp").mapping
      return conf
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "rcasia/neotest-java",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-java",
        },
      }
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
  },
  -- { "nvim-java/nvim-java", ft = "java" },

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
    -- config = function()
    -- require("treesitter").setup {
    --   vim.filetype.add {
    --     pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    --   },
    -- }
    -- end,
  },

  --[[
▗▖ ▗▖▗▄▄▄▖     ▗▄▄▖▗▄▄▄▖▗▖ ▗▖▗▄▄▄▖▗▄▄▄▖
▐▌ ▐▌  █      ▐▌     █  ▐▌ ▐▌▐▌   ▐▌   
▐▌ ▐▌  █       ▝▀▚▖  █  ▐▌ ▐▌▐▛▀▀▘▐▛▀▀▘
▝▚▄▞▘▗▄█▄▖    ▗▄▄▞▘  █  ▝▚▄▞▘▐▌   ▐▌   

]]
  {
    "nvim-telescope/telescope.nvim",
    keys = require("configs.telescope").keys,
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

  --[[
  ▗▖  ▗▖ ▗▄▖ ▗▖  ▗▖▗▄▄▄▖ ▗▄▄▖ ▗▄▖▗▄▄▄▖▗▄▄▄▖ ▗▄▖ ▗▖  ▗▖
  ▐▛▚▖▐▌▐▌ ▐▌▐▌  ▐▌  █  ▐▌   ▐▌ ▐▌ █    █  ▐▌ ▐▌▐▛▚▖▐▌
  ▐▌ ▝▜▌▐▛▀▜▌▐▌  ▐▌  █  ▐▌▝▜▌▐▛▀▜▌ █    █  ▐▌ ▐▌▐▌ ▝▜▌
  ▐▌  ▐▌▐▌ ▐▌ ▝▚▞▘ ▗▄█▄▖▝▚▄▞▘▐▌ ▐▌ █  ▗▄█▄▖▝▚▄▞▘▐▌  ▐▌
  --]]
  {
    "Theprimeagen/harpoon",
    config = true,
    keys = require "configs.harpoon",
  },
  {
    "leath-dub/snipe.nvim",
    keys = {
      {
        "<leader>L",
        function()
          require("snipe").open_buffer_menu()
        end,
        desc = "Open Snipe buffer menu",
      },
    },
    opts = {},
  },
  {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
    opts = require "configs.cord",
  },

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
    event = "VeryLazy",
    config = function()
      require "configs.tmux-navigation"
    end,
    enabled = false,
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
}
