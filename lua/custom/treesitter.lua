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

