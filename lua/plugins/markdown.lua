return {
  -- Side-by-side live browser preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && ./install.sh",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_echo_preview_url = 1
    end,
    keys = {
      { "<leader>tm", "<cmd>MarkdownPreviewToggle<CR>", ft = "markdown", desc = "Toggle Markdown Preview" },
    },
  },

  -- In-buffer rich Markdown rendering (styled headings, tables, callout blocks, checkboxes)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {},
  },
}
