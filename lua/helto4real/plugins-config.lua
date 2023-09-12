-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup(
    {
        {
            -- Tokyo night theme
            'folke/tokyonight.nvim',
            as = 'tokyonight',
        },
        {'akinsho/toggleterm.nvim'},
        --  The configuration is done below. Search for lspconfig to find it below.
        {
            -- LSP Configuration & Plugins
            'neovim/nvim-lspconfig',
            dependencies = {
                -- Automatically install LSPs to stdpath for neovim
                { 'williamboman/mason.nvim', config = true },
                'williamboman/mason-lspconfig.nvim',

                -- Useful status updates for LSP
                -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
                { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

                -- Additional lua configuration, makes nvim stuff amazing!
                'folke/neodev.nvim',
            },
        },
        {
            -- Set lualine as statusline
            'nvim-lualine/lualine.nvim',
            -- See `:help lualine.txt`
            opts = {
                options = {
                    icons_enabled = true,
                    theme = 'nightfly',
                    component_separators = '|',
                    section_separators = '',
                },
            },
        },
        {
            -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            dependencies = {
                'nvim-treesitter/nvim-treesitter-textobjects',
            },
            build = ':TSUpdate',
        },
        {
            -- enables undo in several steps
            'mbbill/undotree'
        },
        {
            'christoomey/vim-tmux-navigator',
        },
        {
            'numToStr/Comment.nvim',
        },
        -- Fuzzy Finder (files, lsp, etc)
        {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            dependencies = {
                'nvim-lua/plenary.nvim',
                -- Fuzzy Finder Algorithm which requires local dependencies to be built.
                -- Only load if `make` is available. Make sure you have the system
                -- requirements installed.
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    -- NOTE: If you are having trouble with this installation,
                    --       refer to the README for telescope-fzf-native for more instructions.
                    build = 'make',
                    cond = function()
                        return vim.fn.executable 'make' == 1
                    end,
                },
            },
        },
        {
            -- Autocompletion
            'hrsh7th/nvim-cmp',
            dependencies = {
                -- Snippet Engine & its associated nvim-cmp source
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',
                -- Adds LSP completion capabilities
                'hrsh7th/cmp-nvim-lsp',
                -- Adds a number of user-friendly snippets
                'rafamadriz/friendly-snippets',
            },
        },
        -- Git related plugins
        'tpope/vim-fugitive',
        'tpope/vim-rhubarb',
        'nvim-tree/nvim-tree.lua',
        'kyazdani42/nvim-web-devicons',
        { 'folke/which-key.nvim', opts = {} },
        'simrat39/rust-tools.nvim',
        -- Debugging
        'nvim-lua/plenary.nvim',
        'mfussenegger/nvim-dap',
        'folke/zen-mode.nvim',
        'theHamsta/nvim-dap-virtual-text',
        {
            'stevearc/dressing.nvim',
            event = "VeryLazy",
        },
        {
            "folke/trouble.nvim",
            --dependencies = { "nvim-tree/nvim-web-devicons" },
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
        },
        {
            "rest-nvim/rest.nvim",
            dependencies = {"nvim-lua/plenary.nvim"},
        },
        require 'helto4real.plugins.debug',

        -- Detect tabstop and shiftwidth automatically
        --'tpope/vim-sleuth',

        --{
        --    -- Highlight, edit, and navigate code
        --    'nvim-treesitter/nvim-treesitter',
        --    dependencies = {
        --      'nvim-treesitter/nvim-treesitter-textobjects',
        --    },
        --    build = ':TSUpdate',
        --},
    }
)
