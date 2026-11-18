return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic", -- "classic", "modern", or "helix"
    delay = 200, -- delay in ms before the popup appears
    spec = {
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>c", group = "Code" },
      { "<leader>g", group = "Git" },
      { "<leader>r", group = "Rename" },
      { "<leader>t", group = "Toggle" },
      { "<leader>a", desc = "Harpoon add file" },
      { "<leader>m", desc = "Harpoon quick menu" },
      { "<leader>p", desc = "Harpoon previous file" },
      { "<leader>n", desc = "Harpoon next file" },
      { "<leader>1", desc = "Harpoon file 1" },
      { "<leader>2", desc = "Harpoon file 2" },
      { "<leader>3", desc = "Harpoon file 3" },
      { "<leader>4", desc = "Harpoon file 4" },
      { "<leader>5", desc = "Harpoon file 5" },
      { "<leader>h", desc = "Window left / Horizontal split" },
      { "<leader>v", desc = "Vertical split" },
      { "<leader>q", desc = "Quit window" },
      { "<leader>w", desc = "Save buffer" },
      { "<leader>Q", desc = "Save and quit all" },
      { "<leader>y", desc = "Yank to system clipboard" },
      { "<leader>Y", desc = "Yank line to system clipboard" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
