-- Scroll up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Luasnip
vim.keymap.set("i", "<C-N>", function()
	require('luasnip').jump(1)
end, { silent = true })
vim.keymap.set("i", "<C-P>", function()
	require('luasnip').jump(-1)
end, { silent = true })

-- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "jl", "<Esc>A")
vim.keymap.set("i", "jj", "<Esc>o")
-- switch tabs
vim.keymap.set("n", "<S-l>", "gt")
vim.keymap.set("n", "<S-h>", "gT")

-- Terminal
vim.keymap.set("t", "<C-CR>", "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set("n", "<C-CR>", "<cmd>ToggleTerm direction=float<cr>")

vim.keymap.set("t", "<C-`>", "<cmd>lua _Lazygit_Toggle()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-`>", "<cmd>lua _Lazygit_Toggle()<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Tabs
vim.keymap.set("n", "<leader-1>", "1gt")
vim.keymap.set("n", "<leader-2>", "2gt")
vim.keymap.set("n", "<leader-3>", "3gt")
vim.keymap.set("n", "<leader-4>", "4gt")
vim.keymap.set("n", "<leader-5>", "5gt")

-- resize windows
-- vim.keymap.set("n", "<C-S-L>", "<cmd>vertical resize +1<CR>")
-- vim.keymap.set("n", "<C-S-H>", "<cmd>vertical resize -1<CR>")
-- vim.keymap.set("n", "<S-+>", "<cmd>horizontal resize -1<CR>")
-- vim.keymap.set("n", "<S-=>", "<cmd>horizontal resize +1<CR>")
-- scroll window
-- vim.keymap.set("n", "<S-j>", "<C-d>zz")
-- vim.keymap.set("n", "<S-k>", "<C-u>zz")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
