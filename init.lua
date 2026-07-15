local opt = vim.opt 

vim.g.loaded_netrw = 1 
vim.g.loaded_netrwPlugin = 1 
opt.termguicolors = true 

opt.expandtab = true 
opt.tabstop = 8 
opt.softtabstop = 0 
opt.shiftwidth = 4 
opt.signcolumn = "yes:1" 
opt.smartindent = true 
opt.autoindent = true 
vim.o.relativenumber = true vim.o.number = true 

vim.opt.clipboard = "unnamedplus"

vim.cmd[[nnoremap <c-q> <c-v> ]] 
vim.cmd[[set background=dark ]] 
vim.cmd[[set syntax=on ]] 
vim.cmd[[set nowrap]]
vim.g.mapleader = " " 

vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<Enter>', { noremap = true}) 
vim.api.nvim_set_keymap('i', '{}', '{}<Left>', { noremap = true }) 
vim.api.nvim_set_keymap('i', '{}<Cr>', '{<CR>}<C-o>O', { noremap = true }) 
vim.api.nvim_set_keymap('i', '()', '()<Left>', { noremap = true }) 
vim.api.nvim_set_keymap('i', '[]', '[]<Left>', { noremap = true }) 
vim.api.nvim_set_keymap('i', '<>', '<><Left>', { noremap = true }) 
vim.api.nvim_set_keymap('i', '""', '""<Left>', { noremap = true }) 

vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>vs', ':vsplit<Enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>hs', ':split<Enter>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>q', ':q<Enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<Enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>Q', ':wqall<Enter>', { noremap = true})

vim.api.nvim_set_keymap('t', "<esc>", '<C-\\><C-N>', { noremap = true })

require("config.lazy")
require("config.lsp")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
