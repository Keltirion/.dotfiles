-- ~./config/nvim/$USER/lua/terminal.lua
local api = vim.api

api.nvim_command("autocmd TermOpen * startinsert") -- starts in insert mode
api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber") -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=yes") -- sign column

vim.keymap.set('t', '<esc>', "<C-\\><C-n>")
