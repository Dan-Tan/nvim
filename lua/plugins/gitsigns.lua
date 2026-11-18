return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation between git hunks
      map("n", "]h", function()
        if vim.wo.diff then return "]h" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, { expr = true, desc = "Next git hunk" })

      map("n", "[h", function()
        if vim.wo.diff then return "[h" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, { expr = true, desc = "Previous git hunk" })

      -- Actions
      map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview git hunk" })
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Git blame line" })
      map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle inline git blame" })
      map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset git hunk" })
      map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset entire buffer" })
      map("n", "<leader>gd", gs.diffthis, { desc = "Git diff current buffer" })
    end,
  },
}
