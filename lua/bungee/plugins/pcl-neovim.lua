local status_ok, project = pcall(require, "pcl-neovim ")
if not status_ok then
	return
end

-- require("nvim-treesitter.configs").setup({
-- 	ensure_installed = "all", -- or "pcl" for just this plugin.
-- 	highlight = {
-- 		enable = true, -- false will disable the whole extension
-- 	},
-- 	indent = {
-- 		enable = true,
-- 	},
-- })
