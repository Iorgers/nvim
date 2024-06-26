local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require("lazy").setup({

    'github/copilot.vim',

    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    { "tpope/vim-commentary" },

    -- Ollama integration
    { "David-Kunz/gen.nvim" },


    -- ChatGPT integration
    {
      "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
          require("chatgpt").setup()
        end,
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "folke/trouble.nvim",
          "nvim-telescope/telescope.nvim"
        }
    },

    -- Another ChatGPT plugin
    {
        "robitx/gp.nvim",
        config = function()
            require("gp").setup()

            -- or setup with your own config (see Install > Configuration in Readme)
            -- require("gp").setup(config)

                -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
        end,
    },

    -- PHP
    'praem90/nvim-phpcsf',

    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
      },
      config = true
    },


    -- Colorschemes
    { 'rose-pine/neovim', as = 'rose-pine' },
    { "catppuccin/nvim", name = "catppuccin" },

    'folke/tokyonight.nvim',

    -- Trouble
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate' },

    'nvim-treesitter/playground',

    'nvim-treesitter/nvim-treesitter-textobjects',

    -- Undotree
    'mbbill/undotree',

    -- Git Integration
    'tpope/vim-fugitive',

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    -- LSP Config
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },

    -- Cool stuff
    'eandrju/cellular-automaton.nvim',
    'folke/zen-mode.nvim',
})

