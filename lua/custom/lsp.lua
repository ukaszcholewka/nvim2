local capabilities = require('cmp_nvim_lsp').default_capabilities()


local lsp_zero = require('lsp-zero')

-- 1. Keymaps (Standard LspAttach)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)

    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "ef", function() vim.lsp.buf.format() end, opts)

    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)

    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

    vim.keymap.set("n", "fr", "<cmd>:Telescope lsp_references<CR>", opts)
    vim.keymap.set("n", "ft", "<cmd>:Telescope lsp_type_definitions<CR>", opts)
    vim.keymap.set("n", "fy", "<cmd>:Telescope registers<CR>", opts)
    vim.keymap.set("n", "fj", "<cmd>:Telescope jumplist<CR>", opts)
  end,
})

-- 2. Define Custom Server (Ripple)
-- We do this BEFORE mason-lspconfig to avoid "not found" errors
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

if not configs.ripple then
  configs.ripple = {
    default_config = {
      cmd = { 'ripple-language-server', '--stdio' },
      filetypes = { 'ripple' },
      root_dir = lspconfig.util.root_pattern('package.json', '.git'),
      settings = {},
    }
  }
end

-- 3. Mason Setup
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'tailwindcss', 'lua_ls' },
  handlers = {
    function(server_name)
      -- This uses the standard setup that lsp-zero expects
      require('lspconfig')[server_name].setup({
        capabilities = capabilities, -- ADD THIS
      })
    end,
  },
})

-- 4. Enable Ripple manually
lspconfig.ripple.setup({
  capabilities = capabilities, -- ADD THIS
})
-- 5. Completion (Keep your existing CMP config)
local cmp = require('cmp')
cmp.setup({
  sources = { { name = 'nvim_lsp' } },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  })
})

-- 6. Filetype detection
vim.filetype.add({
  extension = { ripple = 'ripple' }
})



vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
