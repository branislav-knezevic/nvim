local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = { "src/parser.c" },
	},
	filetype = "gotmpl",
	used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
}

-- build = ":TSUpdate"
-- event = { "BufReadPre", "BufNewFile" }

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages

	ignore_install = { "" }, -- List of parsers to ignore installing

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},

	autopairs = {
		enable = true,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},

	indent = {
		enable = true,
		disable = { "css" },
	},

	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
