require("catppuccin").setup({
  flavor = "mocha",
  transparent_background = true
})

function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.cmd("hi NormalNC guibg=NONE")
  vim.cmd("hi FloatBorder guibg=NONE")
  vim.cmd("hi SignColumn guibg=NONE")
  -- vim.api.nvim_set_hl(0, "guibg", { color = "none" })
  -- :hi Normal NC ctermbg=NONE guibg=NONE
end

ColorMyPencils("cyberdream")
