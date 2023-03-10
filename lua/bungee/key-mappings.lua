local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remap ESC in visual and insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)


--  moving up and down work as you would expect
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)
-- map('n', '^', 'g^')
-- map('n', '$', 'g$')

-- select whole line
keymap('n', 'vv', '0v$', opts)

-- split resize
keymap('n', '<C-h>', ':vertical resize -5<CR>', opts)
keymap('n', '<C-j>', ':resize -5<CR>', opts)
keymap('n', '<C-k>', ':resize +5<CR>', opts)
keymap('n', '<C-l>', ':vertical resize +5<CR>', opts)

-- enable . command in visual mode
keymap('v', '.', ':normal .<cr>', opts)

-- scroll the viewport faster
keymap('n', '<C-e>', '3<C-e>', opts)
keymap('n', '<C-y>', '3<C-y>', opts)


-- make Y behave like C or D
keymap('n', 'Y', 'y$', opts)


-- Set search to always keep the text in the middle of the screen
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', 'J', 'mzJ`z', opts)

-- Adding breakpoints for undo
-- keymap('i', ',', ',<c-g>u', opts)
-- keymap('i', '.', '.<c-g>u', opts)
-- keymap('i', '!', '!<c-g>u', opts)
-- keymap('i', '?', '?<c-g>u', opts)

-- moving lines
keymap('v', 'J', ':m >+1<CR>gv=gv', opts)
keymap('v', 'K', ':m <-2<CR>gv=gv', opts)
-- keymap('n', '<leader>[', ':m .-2<CR>==', opts)
-- keymap('n', '<leader>]', ':m .+1<CR>==', opts)

-- when pasting in visual, keep previous clipboard
-- keymap("v", "p", '"_dP', opts)
keymap("v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', opts)

-- Create blank line above or below
keymap("n", "[<space>", ":call append(line('.')-1, '')<CR>", opts) -- above
keymap("n", "]<space>", ":call append(line('.'), '')<CR>", opts) -- below
