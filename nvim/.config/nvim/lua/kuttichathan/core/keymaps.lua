vim.g.mapleader = ' '  
vim.g.maplocalleader = ' '  

local set = vim.keymap.set

set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

local opts = { noremap = true, silent = true }

-- Save File  
set('n', '<C-s>', '<cmd> w <CR>', opts)

-- Buffer Management
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<C-Shift-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<C-w>', ':bdelete!<CR>', opts)   -- close buffer
vim.keymap.set('n', '<C-n>', '<cmd> enew <CR>', opts) -- new buffer