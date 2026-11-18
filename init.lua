-- Set leader keys before any mappings and before plugins load
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

-- Set Julia indent style: use one block indent level instead of aligning with open parenthesis
vim.g.julia_indent_align = 0
vim.g.julia_indent_align_brackets = 0

-- Do not sync unnamed register with system clipboard (prevents lag on d/c/x/p/y)
-- Use "+y and "+p (or <leader>y) to interact with system clipboard
opt.clipboard = ""

-- Explicit yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- Netrw configuration for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- General options
opt.termguicolors = true
opt.expandtab = true
opt.tabstop = 8
opt.softtabstop = 0
opt.shiftwidth = 4
opt.signcolumn = "yes:1"
opt.smartindent = true
opt.autoindent = true
opt.relativenumber = true
opt.number = true
opt.wrap = false
opt.background = "dark"

-- Keymaps
vim.keymap.set("n", "<C-q>", "<C-v>", { desc = "Visual block mode" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- Auto-close brackets
vim.keymap.set("i", "{}", "{}<Left>")
vim.keymap.set("i", "{}<CR>", "{<CR>}<C-o>O")
vim.keymap.set("i", "()", "()<Left>")
vim.keymap.set("i", "[]", "[]<Left>")
vim.keymap.set("i", "<>", "<><Left>")
vim.keymap.set("i", '""', '""<Left>')

-- Window navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Window right" })

-- Window splits
vim.keymap.set("n", "<leader>vs", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>hs", "<cmd>split<CR>", { desc = "Horizontal split" })

-- Buffer / window management
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>Q", "<cmd>wqall<CR>", { desc = "Save and quit all" })

-- Terminal escape (<Esc><Esc> avoids swallowing single Esc in interactive terminal CLI tools)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Load lazy and LSP configuration
if vim.g.vscode then
  local vscode = require("vscode")

  -- Map your existing <leader> keys to native VS Code actions
  vim.keymap.set("n", "<leader>t", function() vscode.action("workbench.action.toggleSidebarVisibility") end)
  vim.keymap.set("n", "<leader>w", function() vscode.action("workbench.action.files.save") end)
  vim.keymap.set("n", "<leader>q", function() vscode.action("workbench.action.closeActiveEditor") end)
  vim.keymap.set("n", "<leader>Q", function() vscode.action("workbench.action.closeAllEditors") end)
  vim.keymap.set("n", "<leader>vs", function() vscode.action("workbench.action.splitEditorRight") end)
  vim.keymap.set("n", "<leader>hs", function() vscode.action("workbench.action.splitEditorDown") end)
  vim.keymap.set("n", "<leader>h", function() vscode.action("workbench.action.navigateLeft") end)
  vim.keymap.set("n", "<leader>j", function() vscode.action("workbench.action.navigateDown") end)
  vim.keymap.set("n", "<leader>k", function() vscode.action("workbench.action.navigateUp") end)
  vim.keymap.set("n", "<leader>l", function() vscode.action("workbench.action.navigateRight") end)
else
  -- Load lazy and LSP configuration only in terminal Neovim
  require("config.lazy")
  require("config.lsp")
end
