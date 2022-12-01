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


-- clear search highlighting
-- keymap('n', '<leader>c', ':nohl<CR><C-l>:echo "Search Cleared"<CR>', opts)


--  moving up and down work as you would expect
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)
-- map('n', '^', 'g^')
-- map('n', '$', 'g$')

-- select whole line
keymap('n', 'vv', '0v$', opts)

-- set list
-- keymap('n', '<leader>l', ':set list!<cr>', opts)

-- relaod vim cofiguration
-- keymap('n', '<leader>r', ':source ~/.config/nvim/init.lua<CR>', opts)

-- File and Window Mnagement
-- keymap('n', '<leader>w', ':w<CR>', opts)
-- keymap('n', '<leader><space>', ':w<CR>', opts)
-- keymap('n', '<leader>q', ':q<CR>', opts)
-- keymap('n', '<leader>q!', ':q!<CR>', opts)
-- keymap('n', '<leader>x', ':x<CR>', opts)


-- change current word to UPPERCASE
-- keymap('n', '<leader>u', 'gUiwe', opts)
-- change current word to lowercase
-- keymap('n', '<leader>i', 'guiwe', opts)


-- Tabs

-- for some reason alt or ctrl mapping doesn't work
-- keymap('n', '<leader>t', ':tabnew<CR> ', opts)
-- keymap('n', '<leader>1', '1gt', opts)
-- keymap('n', '<leader>2', '2gt', opts)
-- keymap('n', '<leader>3', '3gt', opts)
-- keymap('n', '<leader>4', '4gt', opts)
-- keymap('n', '<leader>5', '5gt', opts)
-- keymap('n', '<leader>t;', ':tabnext<CR>', opts)
-- keymap('n', '<leader>t,', ':tabprevious<CR>', opts)


-- Buffers

-- switch between current and last buffer
-- keymap('n', '<leader>.', '<C-^>', opts)
-- go to previous/next buffer
-- keymap('n', '<leader>;', ':bn', opts)
-- keymap('n', '<leader>,', ':bp', opts)

-- don't close the split when buffer is closed
-- command Bd bp | sp | bn | bd
-- keymap('n', '<leader>Q', ':Bd<CR>', opts)


-- Splits

--  create horizontal split
-- keymap('n', '<leader>\\', ':vsplit<CR>', opts)
-- create hozirontal split
-- keymap('n', '<leader>-', ':split<CR>', opts)

-- split movement
-- keymap('n', '<leader>j', '<C-w>j', opts)
-- keymap('n', '<leader>h', '<C-w>h', opts)
-- keymap('n', '<leader>k', '<C-w>k', opts)
-- keymap('n', '<leader>l', '<C-w>l', opts)

-- split resize
keymap('n', '<C-h>', ':vertical resize -5<CR>', opts)
keymap('n', '<C-j>', ':resize -5<CR>', opts)
keymap('n', '<C-k>', ':resize +5<CR>', opts)
keymap('n', '<C-l>', ':vertical resize +5<CR>', opts)
-- split zoom
-- keymap('n', '<leader>z', '<Plug>Zoom', opts)

-- enable . command in visual mode
keymap('v', '.', ':normal .<cr>', opts)

-- scroll the viewport faster
keymap('n', '<C-e>', '3<C-e>', opts)
keymap('n', '<C-y>', '3<C-y>', opts)


-- make Y behave like C or D
keymap('n', 'Y', 'y$', opts)

-- select text till the end of the line
-- keymap('n', '<leader>p', 'v$h', opts)

-- Set search to always keep the text in the middle of the screen
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)
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
keymap("v", "p", '"_dP', opts)
