local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Packer manager
    use "nvim-lua/plenary.nvim" -- Useful lua functions for lots of plugins
    use "nvim-lua/popup.nvim" -- Popup API -- used by other plugins

    -- nvim/surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- Gruvbox color scheme
    use { "ellisonleao/gruvbox.nvim" }

    -- CMP auto completion related plugins
    use 'hrsh7th/nvim-cmp' -- Completion plugin
    use 'hrsh7th/cmp-buffer' -- buffer completion
    use 'hrsh7th/cmp-path' -- path completion
    use 'hrsh7th/cmp-cmdline' -- cmdline completions
    use 'saadparwaiz1/cmp_luasnip' -- snippet completions
    use 'L3MON4D3/LuaSnip' -- snippet engine
    use 'rafamadriz/friendly-snippets' -- a bunch of useful snippets
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'


    -- LSP plugins
    use 'neovim/nvim-lspconfig' -- enable lspconfig
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    -- use 'nvim-telescope/telescope-media-files.nvim'

    -- TreeSitter syntax highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    use "p00f/nvim-ts-rainbow"
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins

    -- Autopairs plugin - closes parens and quotes
    use 'windwp/nvim-autopairs'

    -- Comments plugin
    -- main commenting plugin
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- adds context functionality to use different commenting string depending on context. Useful for jsx.

    -- Gitsigns
    use 'lewis6991/gitsigns.nvim'

    --[[ Nvim Tree ]]
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Lualine status
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Bufferline/tabs plugin
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use 'moll/vim-bbye'

    -- Toggle term
    use 'akinsho/toggleterm.nvim'

    -- Colorizer
    use 'NvChad/nvim-colorizer.lua'

    
    -- Hop/EasyMotion
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }


    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
