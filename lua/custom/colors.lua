require("catppuccin").setup({
  flavor = "mocha",
  transparent_background = true
})

function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "TreeSitterContextLineNumber", { fg = "#cccccc" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#eeeeee" })
  vim.cmd("hi NormalNC guibg=NONE")
  vim.cmd("hi FloatBorder guibg=NONE")
  vim.cmd("hi SignColumn guibg=NONE")
  vim.cmd("hi TelescopeBorder guifg=#ffffff")
  -- vim.api.nvim_set_hl(0, "guibg", { color = "none" })
  -- :hi Normal NC ctermbg=NONE guibg=NONE
end

ColorMyPencils("cyberdream")
