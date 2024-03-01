-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- https://www.reddit.com/r/neovim/comments/13zd9sc/is_there_a_way_to_configure_indentation_per/
-- https://www.reddit.com/r/neovim/comments/vu1y6e/correct_way_to_set_language_specific_settings_in/
vim.cmd([[
  augroup myfiletypes
    autocmd!
    autocmd FileType ruby,lua,eruby,yaml,javascript,typescript,html,css set ai sw=2 sts=2 et
    autocmd FileType java,kotlin,xml set ai sw=4 sts=4 et
    autocmd FileType asciidoc setlocal wrap
  augroup END
]])

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})
