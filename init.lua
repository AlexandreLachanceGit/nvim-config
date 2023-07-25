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

vim.g.mapleader = " "

require("lazy").setup({
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "marko-cerovac/material.nvim",

    { "nvim-treesitter/nvim-treesitter" }, --, { build = ":TSUpdate" }*/ },
    "windwp/nvim-autopairs",

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },

    "nvim-lualine/lualine.nvim",

    "numToStr/Comment.nvim",

    "simrat39/rust-tools.nvim",

    "lewis6991/gitsigns.nvim",

    { "ggandor/leap.nvim",
        dependencies = {
            "tpope/vim-repeat"
        }
    },

    "alexghergh/nvim-tmux-navigation",

    "habamax/vim-godot",

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig", -- Required
            "williamboman/mason.nvim", -- Optional
            "williamboman/mason-lspconfig.nvim", -- Optional

            -- Autocompletion
            "hrsh7th/nvim-cmp", -- Required
            "hrsh7th/cmp-nvim-lsp", -- Required
            "hrsh7th/cmp-buffer", -- Optional
            "hrsh7th/cmp-path", -- Optional
            "saadparwaiz1/cmp_luasnip", -- Optional
            "hrsh7th/cmp-nvim-lua", -- Optional

            -- Snippets
            "L3MON4D3/LuaSnip", -- Required
            "rafamadriz/friendly-snippets", -- Optional
        }
    },
})
require("alex")
