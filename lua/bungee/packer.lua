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
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" }) -- easy commenting of code
	use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- commenting on steroids
	use({ "nvim-tree/nvim-web-devicons" }) -- emoji icons
	use({ "nvim-tree/nvim-tree.lua" }) -- file explorer
	-- use({ "kyazdani42/nvim-web-devicons" }) -- emoji icons
	-- use({ "kyazdani42/nvim-tree.lua" }) -- file explorer
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }) -- remove file form buffer but keep window
	use({ "voldikss/vim-floaterm" }) -- terminal in Vim
	-- use({ "akinsho/toggleterm.nvim", commit = "c80844fd52ba76f48fabf83e2b9f9b93273f418d" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" }) -- jump to git projects from anywhere
	use({ "lewis6991/impatient.nvim" }) -- spped up vim
	-- use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }) -- helps witn indenting
	use({ "goolord/alpha-nvim" }) -- neovim homepage
	use({ "folke/which-key.nvim" }) -- helps wiht leader mappings
	use({ "kylechui/nvim-surround", tag = "*" }) -- for easily surrouding
	use({ "chentoast/marks.nvim" }) -- manage marks
	use({ "is0n/fm-nvim" }) -- float term file managers

	-- Visual
	use({ "ellisonleao/gruvbox.nvim" }) -- colorscheme
	use({ "https://gitlab.com/yorickpeterse/nvim-window.git" }) -- easily select windows
	use({ "nvim-lualine/lualine.nvim" }) -- status line at the bottom
	-- use({
	-- 	"nyngwang/NeoZoom.lua",
	-- 	commit = "e1b004b7fc375505a4d081695d3b714b1894c9c1",
	-- 	requires = { "nyngwang/NeoNoName.lua" },
	-- }) -- zoom buffer to tab
	use({ "nyngwang/NeoZoom.lua", commit = "1289b900bd478fd135dcc0faf4a43b3cf7524097" }) -- zoom buffer to tab
	-- use({ "sunjon/shade.nvim" }) -- shade non active windows
	-- use { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }

	-- Cmp - completions
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- Old Vim Stuff
	use({ "kana/vim-textobj-user" }) -- needed for next three plugins
	-- use({ "kana/vim-textobj-line" }) -- line as textobj
	use({ "kana/vim-textobj-indent" }) -- indent as textobj
	use({ "kana/vim-textobj-entire" }) -- whole file as textobj
	use({ "tpope/vim-repeat" }) -- dot command to work with plugin commands

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate" })
	use({ "hashivim/vim-terraform" }) -- helps with terraform syntax
	use({ "towolf/vim-helm" }) -- helps with helm syntax

	-- Markdown
	-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
	use({ "plasticboy/vim-markdown" })
	use({ "davidgranstrom/nvim-markdown-preview" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- use({ "nvim-treesitter/nvim-treesitter", commit = "c09932bd2de01dc9c01e870fe83060693c67de13" })
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	}) -- text objects
	use({ "p00f/nvim-ts-rainbow" }) -- brackets with different colors
	use({ "ngalaiko/tree-sitter-go-template" }) -- for helm syntax
	-- Apple
	use({ "https://github.pie.apple.com/pcl/pcl-neovim.git", after = "nvim-treesitter", run = ":TSInstall pcl" }) --plugin for Apple's pcl files
	use({ "https://github.com/apple/pkl-neovim.git", after = "nvim-treesitter", run = ":TSInstall pkl" }) --plugin for Apple's pkl files

	-- Git
	use({ "tpope/vim-fugitive" }) -- old Vim plugin for Git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "kdheepak/lazygit.nvim" }) -- lazygit

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
