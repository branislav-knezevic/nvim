local cmp_status_ok, focus = pcall(require, "focus") -- float term file managers
if not cmp_status_ok then
	return
end

require("focus").setup({ hybridnumber = true, excluded_filetypes = { "toggleterm" } })
