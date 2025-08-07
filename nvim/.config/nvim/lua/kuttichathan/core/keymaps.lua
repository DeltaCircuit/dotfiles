vim.g.mapleader = ' '  
vim.g.maplocalleader = ' '  

local set = vim.keymap.set

set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

local opts = { noremap = true, silent = true }

-- Save File  
set('n', '<C-s>', '<cmd> w <CR>', opts)