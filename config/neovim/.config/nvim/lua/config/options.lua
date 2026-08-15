local opts = vim.opt

-- Disable netrw since we use neo-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opts.expandtab = true

opts.tabstop = 2
opts.softtabstop = 2
opts.shiftwidth = 2

opts.number = true
opts.relativenumber = true
opts.signcolumn = "yes:1"

opts.clipboard = "unnamedplus"

opts.termguicolors = true
-- opts.guifont = "Hack Nerd Font"
-- opts.guifont = "FiraCode Nerd Font"
opts.guifont = "MesloLGL Nerd Font"

opts.cursorline = true

opts.showmode = false

opts.hlsearch = true

opts.ignorecase = true
opts.smartcase = true

-- Treesitter folding
opts.foldmethod = "expr"
opts.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opts.foldlevel = 99

