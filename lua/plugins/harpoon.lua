return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local harpoon_extensions = require("harpoon.extensions")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },
    })

    -- Highlight current file in the Harpoon quick menu list
    if harpoon_extensions and harpoon_extensions.builtins and harpoon_extensions.builtins.highlight_current_file then
      harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
    end

    -- Menu shortcuts: split/vsplit/tab directly from inside the quick menu
    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr, desc = "Harpoon open in vertical split" })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr, desc = "Harpoon open in horizontal split" })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr, desc = "Harpoon open in tab" })
      end,
    })

    -- Harpoon Quick Menu (UI)
    local function toggle_harpoon_menu()
      harpoon.ui:toggle_quick_menu(harpoon:list(), {
        border = "rounded",
        title_pos = "center",
      })
    end

    -- 1. Add current file to Harpoon
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
      local filename = vim.fn.expand("%:t")
      if filename == "" then
        filename = vim.fn.expand("%:p")
      end
      if filename ~= "" then
        vim.notify("Harpoon: added " .. filename, vim.log.levels.INFO)
      end
    end, { desc = "Harpoon add file" })

    -- 2. Toggle Harpoon quick menu
    vim.keymap.set("n", "<leader>m", toggle_harpoon_menu, { desc = "Harpoon quick menu" })
    vim.keymap.set("n", "<C-e>", toggle_harpoon_menu, { desc = "Harpoon quick menu" })

    -- 3. Jump to files 1-5 directly
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon file 5" })

    -- 4. Cycle previous / next file in list
    vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end, { desc = "Harpoon previous file" })
    vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end, { desc = "Harpoon next file" })

    -- 5. Telescope picker integration (<leader>fm)
    vim.keymap.set("n", "<leader>fm", function()
      local conf = require("telescope.config").values
      local file_paths = {}
      for _, item in ipairs(harpoon:list().items) do
        if item and item.value and item.value ~= "" then
          table.insert(file_paths, item.value)
        end
      end

      if #file_paths == 0 then
        vim.notify("Harpoon list is empty", vim.log.levels.INFO)
        return
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon Marks",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end, { desc = "Telescope Harpoon marks" })
  end,
}
