vim.opt.background = "dark"
vim.opt.mouse = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cmdheight = 0
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.foldmethod = "syntax"
vim.opt.backup = false
vim.opt.laststatus = 3
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
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.lsp.set_log_level("off")

vim.g.tpipeline_autoembed = 1

vim.wo.fillchars='eob: '

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[augroup highlight_yank autocmd! au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200}) augroup END]])
-- toggleterm
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
-- terraform
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
