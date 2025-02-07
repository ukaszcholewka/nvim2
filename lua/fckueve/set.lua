vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 10

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "



function SaveMacro(macro_name, reg)
  local file_path = vim.fn.stdpath("config") .. "/nvim/macros/" .. macro_name .. ".lua"
  local file = io.open(file_path, "w")
  local keys = vim.fn.getreg(reg)

  if file ~= nil then
    file:write("vim.api.nvim_feedkeys('", keys, "', 'n', false)")
    file:close()
  end
end

vim.api.nvim_create_user_command('SaveMacro', SaveMacro, {})


