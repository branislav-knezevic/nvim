local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- vim-terraform settings
-- ---------------------------------------------------------------------
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])

-- keymap("n", "<leader>ti", ":!terraform init<CR>", opts)
-- keymap("n", "<leader>tv", ":!terraform validate<CR>", opts)
-- keymap("n", "<leader>tp", ":!terraform plan<CR>", opts)
-- keymap("n", "<leader>taa", ":!terraform apply -auto-approve<CR>", opts)
