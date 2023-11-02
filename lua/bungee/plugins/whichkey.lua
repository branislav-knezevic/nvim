local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["1"] = { "1gt", "1st Tab" },
	["2"] = { "2gt", "2nd Tab" },
	["3"] = { "3gt", "3rd Tab" },
	["4"] = { "4gt", "4th Tab" },
	["5"] = { "5gt", "5th Tab" },
	["q"] = { "<cmd>q<CR>", "Quit" },
	["Q"] = { "<cmd>Bdelete<CR>", "Delete buffer" },
	["w"] = { ":lua require('nvim-window').pick()<CR>", "Pick Window" },
	-- ["w"] = { "<cmd>w!<CR>", "Save" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer Open" },
	["r"] = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
	["R"] = { "<cmd>source ~/.config/nvim/init.lua<CR>", "Reload config" },
	["t"] = { "<cmd>tabnew<CR>", "Create Tab" },
	-- t = {
	--   name = "Tabs",
	--   t = { "<cmd>tabnew<CR>", "Create Tab" }
	--   ; = { "<cmd>tabnext<CR>", "Next Tab" }
	--   , = { "<cmd>tabprevious<CR>", "Previous Tab" }
	-- }
	-- ["y"]
	["u"] = { "gUiwe", "UPPERCASE" },
	["i"] = { "guiwe", "lowercase" },
	["o"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{layout_config={width=0.5}, previewer = false})<cr>",
		"Open Files",
	},
	["O"] = { "<cmd>Telescope buffers<CR>", "Open Files" },
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
	-- ["["] = { "<cmd>call append(line('.')-1, '')<CR>", "Add blank line above" },
	-- ["]"] = { "<cmd>call append(line('.'), '')<CR>", "Add blank line below" },
	["["] = { "<cmd>m .-2<CR>==", "Move line up" },
	["]"] = { "<cmd>m .+1<CR>==", "Move line down" },
	["a"] = { "<cmd>NvimTreeFocus<cr>", "Explorer Focus" },
	["A"] = { "<cmd>Alpha<cr>", "Homescreen" },
	s = {
		name = "Search",
		-- g = { "<cmd>Telescope live_grep theme=ivy<cr>", "Grep Text" },
		p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		g = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	},
	-- ["d"]
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{layout_config={width=0.5}, previewer = false})<cr>",
		"Find files",
	},
	["F"] = { "<cmd>Telescope find_files<CR>", "Find Text" },
	g = {
		name = "Git",
		g = { "<cmd>G<cr><C-w>20-", "Git status" },
		a = { "<cmd>G add<cr>", "Git add" },
		m = { "<cmd>G commit<cr>", "Git commit" },
		p = { "<cmd>G push<cr>", "Git push" },
		l = { "<cmd>G pull<cr>", "Git pull" },
		-- B = { "<cmd>G blame<cr>", "Git blame" }
		b = { "<cmd>lua require 'gitsigns'.toggle_current_line_blame()<cr>", "Blame" },
		B = { "<cmd>G branch<cr>", "Git branches" },
		t = { "<cmd>G tag<cr>", "Git tags" },
		c = { "<cmd>G checkout<cr>", "Git checkout" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		d = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		-- B = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		f = { "<cmd>diffget //2<cr>", "Use left side" },
		h = { "<cmd>diffget //3<cr>", "Use right side" },
		-- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		-- r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		-- R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		-- s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		-- u = {
		--   "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		--   "Undo Stage Hunk",
		-- },
		-- o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		-- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		-- c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		-- d = {
		--   "<cmd>Gitsigns diffthis HEAD<cr>",
		--   "Diff",
	},
	["h"] = { "<c-w>h", "Window left" },
	["j"] = { "<c-w>j", "Window down" },
	["k"] = { "<c-w>k", "Window up" },
	["l"] = { "<c-w>l", "Window right" },
	[";"] = { "<cmd>bn<cr>", "Buffer next" },
	-- ["'"]
	["\\"] = { "<cmd>vsplit<CR>", "Vertical split" },
	["-"] = { "<cmd>split<CR>", "Horizontal split" },
	["z"] = { "<cmd>NeoZoomToggle<CR>", "Zoom Toggle" },
	["x"] = { "<cmd>x<CR>", "Save and close" },
	c = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	["v"] = { "v$h", "Select till end" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{layout_config={width=0.5}, previewer = false})<cr>",
		"Buffers",
	},
	["n"] = { "<Cmd>lua require'shade'.toggle()<CR>", "Toggle shade" },
	-- ["m"] = { "<Cmd>Lazygit<CR", "Lazygit" },
	["m"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
	[","] = { "<cmd>bp<CR>", "Previous Buffer" },
	["."] = { "<C-^>", "Last buffer" },
	["/"] = { "<cmd>nohl<CR>", "Clear search" },
	["<space>"] = { "<cmd>w<CR>", "Save" },
	-- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },

	-- t = {
	--   name = "Terminal",
	--   n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
	--   u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
	--   t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
	--   p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
	--   f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
	--   h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
	--   v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	-- },
}

which_key.setup(setup)
which_key.register(mappings, opts)
