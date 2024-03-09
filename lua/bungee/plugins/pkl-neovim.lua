local status_ok, project = pcall(require, "pkl-neovim ")
if not status_ok then
	return
end

local hasConfigs, configs = pcall(require, "nvim-treesitter.configs")
if hasConfigs then
	configs.setup({
		ensure_installed = "pkl",
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		indent = {
			enable = true,
		},
	})
end
