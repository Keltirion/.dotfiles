vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Scroll up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

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

-- fine cmf line
vim.api.nvim_set_keymap('n', '<CR>', '<cmd>FineCmdline<CR>', {noremap = true})

-- toggle floating terminal
vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set("i", "<C-t>", "<cmd>ToggleTerm direction=float<cr>")

-- reload vim config
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
-- leader key
vim.g.mapleader = " "
-- exit insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "jl", "<Esc>A")
vim.keymap.set("i", "jj", "<Esc>o")
-- switch tabs
vim.keymap.set("n", "<S-l>", "gt")
vim.keymap.set("n", "<S-h>", "gT")
-- switch windows
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
