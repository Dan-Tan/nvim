return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      theme = "wave", -- "wave", "dragon", "lotus"
      transparent = false,
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard", -- "hard", "medium", "soft"
    },
  },
  {
    "neanias/everforest-nvim",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- "mocha", "macchiato", "frappe", "latte"
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "moon", -- "moon", "storm", "night", "day"
    },
  },
}
