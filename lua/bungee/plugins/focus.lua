local cmp_status_ok, focus = pcall(require, "focus")
if not cmp_status_ok then
  return
end

-- config = function() 
--   require("focus").setup() 
-- end 

require("focus").setup({hybridnumber = true, excluded_filetypes = {"toggleterm"}})
