vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- use('nvim-tree/nvim-web-devicons')
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "catppuccin/nvim", as = "catppuccin" }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use('theprimeagen/harpoon')
    -- use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use("terrortylor/nvim-comment")
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
    use({ "andrewferrier/wrapping.nvim" })
    use('https://github.com/github/copilot.vim')
    use('NvChad/nvim-colorizer.lua')
    use {
        'samodostal/image.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }
    use {
        'folke/todo-comments.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }
    use('rcarriga/nvim-notify')
    use('lewis6991/gitsigns.nvim')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'gi4c0/lint-node.nvim',
        requires = {
            { 'nvim-telescope/telescope.nvim' }
        }
    }

    -- use({
    --     "epwalsh/obsidian.nvim",
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --     }
    -- })

    use('nvim-lua/plenary.nvim')
    use {
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        -- OR 'ibhagwan/fzf-lua',
        'nvim-tree/nvim-web-devicons',
      },
      config = function ()
        require"octo".setup()
      end
    }
end)
