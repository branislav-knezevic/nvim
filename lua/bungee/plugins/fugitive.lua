-- local status_ok,  = pcall(require, "gitsigns")
-- if not status_ok then
--   return
-- end

-- fugitive plug config
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- keymap("n", "<leader>g", ":G<CR><C-w>20-", opts)
-- keymap("n", "<leader>ga", ":G add .<CR>", opts)
-- keymap("n", "<leader>gm", ":G commit<CR>", opts)
-- keymap("n", "<leader>gp", ":G push<CR>", opts)
-- keymap("n", "<leader>gf", ":G fetch<CR>", opts)
-- keymap("n", "<leader>gl", ":G pull<CR>", opts)
-- keymap("n", "<leader>gB", ":G blame<CR>", opts)
-- keymap("n", "<leader>gb", ":GBranches <CR>", opts)
-- keymap("n", "<leader>gt", ":GTags <CR>", opts)
-- keymap("n", "<leader>gc", ":G checkout<CR>", opts)

-- merging pull requests
-- keymap("n", "<leader>gf", ":diffget //2<CR>", opts)
-- keymap("n", "<leader>gh", ":diffget //3<CR>", opts)
