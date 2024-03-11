local M = {
	"apple/pkl-neovim",
	event = "VeryLazy",
	ft = "pkl",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	build = function()
		vim.cmd(":TSInstall! pkl")
	end,
}

return M
