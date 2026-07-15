return {
  {
    "lervag/vimtex",
    lazy = false, -- VimTeX recommends not lazy-loading
    init = function()
      -- Use Evince as the PDF viewer via the general viewer interface
      -- (This avoids DBus connection issues while still letting Evince auto-reload the PDF)
      vim.g.vimtex_view_method = 'general'
      vim.g.vimtex_view_general_viewer = 'evince'

      -- Automatically open/refresh the viewer on compilation
      vim.g.vimtex_view_automatic = 1
    end,
  }
}
