-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                fold_open = "v",  -- icon used for open folds
                fold_closed = ">", -- icon used for closed folds
                indent_lines = false, -- add an indent guide below the fold icons
                signs = {
                    -- icons / text used for a diagnostic
                    error = "error",
                    warning = "warn",
                    hint = "hint",
                    information = "info"
                },
                use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
            }
        end
    })


    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("nvim-treesitter/nvim-treesitter-context");

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
end)
