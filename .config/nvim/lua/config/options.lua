vim.opt.fillchars = { eob = " "}
vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.foldmethod = "syntax"
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.lsp.set_log_level("error")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "hcl",
	callback = function ()
		vim.opt.commentstring = "#%s"
	end
})

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd(
	[[augroup highlight_yank autocmd! au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200}) augroup END]])

-- filetypes
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])

vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

vim.cmd([[autocmd BufRead,BufNewFile docker-compose* set filetype=yaml.docker-compose]])
vim.cmd([[autocmd BufRead,BufNewFile *azure-pipeline* set filetype=yaml.azure-pipelines]])

vim.cmd([[autocmd BufRead,BufNewFile *azure-pipeline* set filetype=yaml.azure-pipelines]])
