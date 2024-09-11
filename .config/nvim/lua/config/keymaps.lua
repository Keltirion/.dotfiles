-- leader key
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Scroll up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-j>", function ()
	require('luasnip').jump(1)
end)
vim.keymap.set("i", "<C-k>", function ()
	require('luasnip').jump(-1)
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- toggle floating terminal
vim.keymap.set("n", "<C-`>", "<cmd>ToggleTerm size=30 dir=git_dir direction=horizontal<cr>")
vim.keymap.set("i", "<C-`>", "<cmd>ToggleTerm size=30 dir=git_dir direction=horizontal<cr>")
vim.keymap.set("t", "<C-`>", "<cmd>ToggleTerm size=30 dir=git_dir direction=horizontal<cr>")

vim.keymap.set("n", "<Esc>", "i<Cmd>ToggleTerm<cr>")
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- vim.keymap.set("t", "<S-Esc>", "<Esc>")
-- reload vim config
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
-- exit insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "jl", "<Esc>A")
vim.keymap.set("i", "jj", "<Esc>o")
-- switch tabs
vim.keymap.set("n", "<S-l>", "gt")
vim.keymap.set("n", "<S-h>", "gT")

vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- resize windows
-- vim.keymap.set("n", "<C-S-L>", "<cmd>vertical resize +1<CR>")
-- vim.keymap.set("n", "<C-S-H>", "<cmd>vertical resize -1<CR>")
-- vim.keymap.set("n", "<C-+>", "<cmd>horizontal resize -1<CR>")
-- vim.keymap.set("n", "<C-->", "<cmd>horizontal resize +1<CR>")
-- scroll window
vim.keymap.set("n", "<S-j>", "<C-d>zz")
vim.keymap.set("n", "<S-k>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Terminal
vim.keymap.set("t", "<C-Space>", [[<C-\><C-n>]])
