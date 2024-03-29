local options = {
  autoread = true,                         -- detect when a file is changed
  history = 1000,                           -- change history to 1000
  textwidth = 0,                            -- set after how many characters will Vim automatically move to new line 
  backup = false,                          -- creates a backup file
  backspace = {"indent", "eol", "start"},           -- make backspace behave in a sane manner
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  -- mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  numberwidth = 4,                         -- set number column width to 2 {default 4}

  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
  guifont = "monospace:h17",               -- the font used in graphical neovim applications

  -- Searching
  ignorecase = true,   -- case insensitive searching
  smartcase = true,    -- case-sensitive if expresson contains a capital letter
  incsearch = true,    -- set incremental search, like modern browsers
  -- nolazyredraw = true, -- don't redraw while executing macros
  magic = true,        -- Set magic on, for regex

  -- Apperance
  -- syntax = true,            -- enable syntax
  number = true,             -- show line numbers
  relativenumber = true,     -- show relative numbers for easier movement between the lines
  wrap = true,               -- turn on line wrapping
  wrapmargin=8,              -- wrap lines when coming within n characters from side
  linebreak = true,          -- set soft wrapping
  showbreak = "+++",         -- wrap broken lines with previh
  autoindent = true,         -- automatically set indent of new line
  ttyfast = true,            -- faster redrawing
  laststatus = 2,            -- show the status line all the time
  so = 7,                    -- set 7 lines to the cursors - when moving vertical
  wildmenu = true,           -- enhanced command line completion
  wildmode = "full",         -- complete files like a shell
  hidden = true,             -- current buffer can be put into background
  showcmd = true,            -- show incomplete commands
  -- noshowmode = true,         -- don't show which mode disabled for PowerLine
  -- shell = "$SHELL",          -- wet which shell to use
  title = true,              -- set terminal title
  showmatch = true,          -- show matching braces
  mat = 2,                   -- how many tenths of a second to blink

  -- Tabs
  tabstop = 2,       -- the visible width of tabs
  softtabstop = 0,   -- edit as if the tabs are 4 characters wide
  shiftwidth = 2,    -- number of spaces to use for indent and unindent
  shiftround = true, -- round indent to a multiple of 'shiftwidth'
  expandtab = true,  -- expand tabs to space
  -- autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " set two spaces for yaml files

  -- code folding settings
  foldmethod = "syntax", -- fold based on indent
  foldlevelstart = 99,
  foldnestmax = 10,      -- deepest fold is 10 levels
  -- nofoldenable = true,   -- don't fold by default
  foldlevel = 1,

  -- highlight where the coursor is
  cursorline = true,
  -- cursorcolumn = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Mouse
vim.opt.mouse = nil

-- Autocomplete
vim.opt.complete:append "kspell"            -- needed for autocomplete popup
vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
