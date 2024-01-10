local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Extensions
	use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }) -- easy commenting of code
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" }) -- commenting on steroids
	use({ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }) -- emoji icons
	use({ "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }) -- file explorer
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }) -- remove file form buffer but keep window
	use({ "voldikss/vim-floaterm" }) -- terminal in Vim
	-- use({ "akinsho/toggleterm.nvim", commit = "c80844fd52ba76f48fabf83e2b9f9b93273f418d" })
	use({ "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" })
	use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }) -- jump to git projects from anywhere
	use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }) -- spped up vim
	use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }) -- helps witn indenting
	use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }) -- neovim homepage
	use({ "folke/which-key.nvim" }) -- helps wiht leader mappings
	use({ "kylechui/nvim-surround", tag = "*" }) -- for easily surrouding
	use({ "chentoast/marks.nvim" }) -- manage marks
	use({ "is0n/fm-nvim" }) -- float term file managers

	-- Visual
	use({ "ellisonleao/gruvbox.nvim" }) -- colorscheme
	use({ "https://gitlab.com/yorickpeterse/nvim-window.git" }) -- easily select windows
	use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }) -- status line at the bottom
	-- use({
	-- 	"nyngwang/NeoZoom.lua",
	-- 	commit = "e1b004b7fc375505a4d081695d3b714b1894c9c1",
	-- 	requires = { "nyngwang/NeoNoName.lua" },
	-- }) -- zoom buffer to tab
	use({ "nyngwang/NeoZoom.lua", commit = "1289b900bd478fd135dcc0faf4a43b3cf7524097" }) -- zoom buffer to tab
	-- use({ "sunjon/shade.nvim" }) -- shade non active windows
	-- use { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }

	-- Cmp - completions
	use({ "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }) -- a bunch of snippets to use

	-- Old Vim Stuff
	use({ "kana/vim-textobj-user" }) -- needed for next three plugins
	use({ "kana/vim-textobj-line" }) -- line as textobj
	use({ "kana/vim-textobj-indent" }) -- indent as textobj
	use({ "kana/vim-textobj-entire" }) -- whole file as textobj
	use({ "tpope/vim-repeat" }) -- dot command to work with plugin commands

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" }) -- enable LSP
	use({ "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" })
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" })
	use({ "hashivim/vim-terraform" }) -- helps with terraform syntax
	use({ "towolf/vim-helm" }) -- helps with helm syntax

	-- Markdown
	-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
	use({ "plasticboy/vim-markdown" })
	use({ "davidgranstrom/nvim-markdown-preview" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", commit = "32d0baae44f5fd0416128c871fca6d9e27b60b3d" })
	use({ "p00f/nvim-ts-rainbow" }) -- brackets with different colors
	use({ "ngalaiko/tree-sitter-go-template" }) -- for helm syntax

	-- Git
	use({ "tpope/vim-fugitive" }) -- old Vim plugin for Git
	use({ "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" })
	use({ "kdheepak/lazygit.nvim" }) -- lazygit

	-- Apple
	use({ "https://github.pie.apple.com/pcl/pcl-neovim.git", after = "nvim-treesitter", run = ":TSInstall! pcl" }) --pluging for Apple's pcl files

	-- Noice
	-- window like notifications
	use({ "folke/noice.nvim" }) -- window like cmd
	use({ "MunifTanjim/nui.nvim" }) -- nvim UI, needed for this
	use({ "rcarriga/nvim-notify" }) -- notifications, needed for this

	-- automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
