local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false

end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'mbbill/undotree'
	use 'theprimeagen/harpoon'
	use 'tpope/vim-fugitive'
	use 'nvim-tree/nvim-web-devicons'
	use 'kdheepak/lazygit.nvim'
	use 'navarasu/onedark.nvim'
	use 'nanozuki/tabby.nvim'
	use 'lukas-reineke/indent-blankline.nvim'

	use {
		'ahmedkhalf/project.nvim',
		config = function()
			require("project_nvim").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	use {
		'ggandor/leap.nvim',
		requires = { { 'tpope/vim-repeat' } }
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	use {
		'terrortylor/nvim-comment',
		config = function()
			require('nvim_comment').setup({
				comment_empty = false
			})
		end
	}

	use {
		'lewis6991/gitsigns.nvim', tag = 'v0.6',
	}

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
			}
		end
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' }, -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
