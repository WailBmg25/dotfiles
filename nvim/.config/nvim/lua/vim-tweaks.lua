vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.autoindent = true
vim.opt.number = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Append hyphen to 'iskeyword' option
vim.opt.iskeyword:append('-')
