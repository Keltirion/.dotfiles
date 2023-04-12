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
	use 'tpope/vim-fugitive'

	-- Apperance
	use 'shaunsingh/nord.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nanozuki/tabby.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use { 'fgheng/winbar.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	}


	-- Keybindings
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				window = {
					border = "single",
					margin = { 0, 0, 0, 0 },
				},
				layout = {
					spacing = 4,
					align = "center",
				}
			}
		end
	}
	-- Git
	use 'kdheepak/lazygit.nvim'
	use { 'lewis6991/gitsigns.nvim', tag = 'v0.6' }

	-- Terminal
	use {
		"akinsho/toggleterm.nvim",
		tag = '*',
		config = function()
			require("toggleterm").setup {
				float_opts = {
					border = "single",
				}
			}
		end
	}

	-- File
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
		tag = 'nightly'
	}

	-- Movement
	use 'theprimeagen/harpoon'
	use {
		'ggandor/leap.nvim',
		requires = { { 'tpope/vim-repeat' } }
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-project.nvim',
			'cljoly/telescope-repo.nvim'
		}
	}
	-- Comment
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	use {
		"someone-stole-my-name/yaml-companion.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("telescope").load_extension("yaml_schema")
		end,
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },          -- Required
			{ 'williamboman/mason.nvim' },        -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },      -- Required
			{ 'hrsh7th/cmp-nvim-lsp' },  -- Required
			{ 'hrsh7th/cmp-buffer' },    -- Optional
			{ 'hrsh7th/cmp-path' },      -- Optional
			{ 'hrsh7th/cmp-nvim-lua' },  -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },          -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
