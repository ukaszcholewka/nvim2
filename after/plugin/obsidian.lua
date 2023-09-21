require("obsidian").setup({
    dir = "~/programming/ts/sneaky/",
})

vim.keymap.set('n', '<leader>of', '<cmd>:ObsidianSearch<CR>', {})
