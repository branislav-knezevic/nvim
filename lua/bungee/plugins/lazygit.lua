local status_ok, lazygit = pcall(require, "lazygit")
if not status_ok then
	return
end

-- lazygit.config = function()
-- 	require("telescope").load_extension("lazygit")
-- end