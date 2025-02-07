vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "gj", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gk", "<cmd>diffget //3<CR>")
vim.keymap.set("n", "<leader>gg", "<cmd>:Gvdiffsplit!<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>:Gclog --name-only<CR>")


return {
	{
		'tpope/vim-fugitive'
	}
}
