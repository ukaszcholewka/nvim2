require'nvim-treesitter.configs'.setup {
	ensure_installed = { "lua", "vim", "javascript", "typescript", "rust", "bash", "python", "vimdoc", "css", "html", "scss" },
	sync_install = false,
	auto_install = true,
	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}


local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.ripple = {
  install_info = {
    url = "https://github.com/Ripple-TS/ripple",
    -- Point exactly to the C files
    files = {"src/parser.c", "src/scanner.c"}, 
    location = "grammars/tree-sitter",
    branch = "main",
    generate_requires_npm = true, -- Ripple often needs npm to generate the grammar
  },
  filetype = "ripple",
}
-- Force nvim-treesitter to show you what's actually happening
require('nvim-treesitter.install').prefer_git = true
