-- Set keymap leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers and mouse support
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true

-- UI
vim.opt.colorcolumn = "80"
vim.opt.list = true
vim.opt.listchars = {
	tab = "│ ",
	trail = "-",
	space = "·",
}

-- History
vim.opt.history = 1000
