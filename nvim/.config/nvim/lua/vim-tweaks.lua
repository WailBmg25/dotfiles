vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.autoindent = true
vim.opt.number = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Append hyphen to 'iskeyword' option
vim.opt.iskeyword:append("-")

--Navigate between windows
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- search keymaps
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Save keymaps
vim.keymap.set("n", "<leader>s", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":wqa<CR>")
