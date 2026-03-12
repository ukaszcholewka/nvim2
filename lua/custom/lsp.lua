local lsp_zero = require('lsp-zero')

-- 1. Keymaps (Standard LspAttach)
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K',  function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', 'rn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
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
            lspconfig[server_name].setup({})
        end,
    },
})

-- 4. Enable Ripple manually
lspconfig.ripple.setup({})

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
