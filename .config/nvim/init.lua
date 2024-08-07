require("config.options")
require("config.keymaps")
require("config.plugins")
require("config.autocommands")

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<M-w>', [[<Cmd>q<CR>]], opts)
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	-- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	-- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	-- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	-- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set('t', '<C-t>', [[<Cmd>ToggleTerm direction=float<cr>]], opts)
	vim.keymap.set('t', '<C-h>', [[<Cmd>ToggleTerm direction=horizontal<cr>]], opts)
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-\><C-n>]], opts)
end

vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]

vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=300})
augroup END
]]

