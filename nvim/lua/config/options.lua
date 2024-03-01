-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.o.relativenumber = false
vim.o.spelllang = "ru_ru,en_us"
vim.o.linebreak = true
vim.g.autoformat = false
vim.opt.autowrite = false
vim.opt.conceallevel = 1
vim.opt.swapfile = false

require("lazyvim.util").get_root = vim.loop.cwd
