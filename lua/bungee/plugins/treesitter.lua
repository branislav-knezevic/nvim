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
	-- ensure_installed = "bash, dockerfile, json, yaml, diff, git_config, git_rebase, gitcommit, gitignore, go, groovy, hcl, java, javascript, ", -- one of "all" or a list of languages
	-- ensure_installed = { "pkl" }, -- one of "all" or a list of languages
	-- auto_install = true,

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
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			disable = {
				"pcl",
				"pkl",
			},
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["at"] = "@class.outer",
				["it"] = "@class.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",
				["a/"] = "@comment.outer",
				["i/"] = "@comment.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["as"] = "@statement.outer",
				["is"] = "@scopename.inner",
				["aA"] = "@attribute.outer",
				["iA"] = "@attribute.inner",
				["aF"] = "@frame.outer",
				["iF"] = "@frame.inner",
				-- ["ac"] = "@call.outer",
				-- ["ic"] = "@call.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
				["]t"] = { query = "@class.outer", desc = "Next class start" },
				["]c"] = { query = "@conditional.outer", desc = "Next conditional start" },
				["]l"] = { query = "@loop.outer", desc = "Next loop start" },
			},
			goto_next_end = {
				["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
				["]T"] = { query = "@class.outer", desc = "Next class end" },
				["]C"] = { query = "@conditional.outer", desc = "Next conditional end" },
				["]L"] = { query = "@loop.outer", desc = "Next loop end" },
			},
			goto_previous_start = {
				["[f"] = { query = "@function.outer", desc = "Next method/function def start" },
				["[t"] = { query = "@class.outer", desc = "Next class start" },
				["[c"] = { query = "@conditional.outer", desc = "Next conditional start" },
				["[l"] = { query = "@loop.outer", desc = "Next loop start" },
			},
			goto_previous_end = {
				["[F"] = { query = "@function.outer", desc = "Next method/function def end" },
				["[T"] = { query = "@class.outer", desc = "Next class end" },
				["[C"] = { query = "@conditional.outer", desc = "Next conditional end" },
				["[L"] = { query = "@loop.outer", desc = "Next loop end" },
			},
		},
	},
})
