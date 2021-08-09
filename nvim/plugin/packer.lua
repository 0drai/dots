-- bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

-- $XDG_DATA_HOME/nvim/..
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
end

local pack = require('packer')

pack.startup(function(use)

    -- packer manages itself
    use {'wbthomason/packer.nvim', opt = true}

    -- classics
    use {'tpope/vim-repeat', keys = {'.'}}
    use {'tpope/vim-surround'}
    use {'tpope/vim-fugitive', cmd = {'Git', 'Gwrite', 'Gedit', 'Gvdiffsplit'}}

    -- align stuff
    use {'godlygeek/tabular', cmd = 'Tabularize'}

    -- move reliably root folder
    use {
        'airblade/vim-rooter',
        config = function() require('plugins.others').rooter() end
    }

    use {'lambdalisue/suda.vim', cmd = {'SudaWrite'}}

    -- checking regs with '"', or in insert mode with <c-r>
    use {'tversteeg/registers.nvim', keys = {'<c-r>', '"'}}

    use {
        'kyazdani42/nvim-tree.lua',
        cmd = {'NvimTreeToggle'},
        wants = 'nvim-web-devicons',
        config = function() require('plugins.nvim-tree') end
    }

    -- LSP stuff
    -- does not need lazy loading, since it is already lazy
    use {
        'neovim/nvim-lspconfig',
        config = function() require('lsp') end,
        event = 'BufRead',
        wants = 'nvim-lspinstall',
        requires = {
            {'kabouzeid/nvim-lspinstall'}, -- install lsps, and provides commands to attach them automatically
            {'ray-x/lsp_signature.nvim'}, -- echodoc in good
            {'glepnir/lspsaga.nvim'}, -- popups and 'gh'
            {'simrat39/rust-tools.nvim', ft = {'rust'}} -- config for rust
        }
    }

    -- linter (ale replacement)
    use {
        'mfussenegger/nvim-lint',
        event = 'BufEnter',
        config = function() require('plugins.lint') end
    }

    -- format with <space>fa
    use {
        'lukas-reineke/format.nvim',
        cmd = {'Format', 'FormatWrite'},
        config = function() require('plugins.format') end
    }

    -- Autocompletion and snippets
    use {
        'hrsh7th/nvim-compe',
        event = 'InsertEnter',
        config = "require('plugins.compe')",
        wants = 'LuaSnip',
        requires = {
            {
                'L3MON4D3/LuaSnip',
                event = 'InsertCharPre',
                wants = 'friendly-snippets'
            }, {'rafamadriz/friendly-snippets', event = 'InsertCharPre'}
        }
    }

    -- FZF replacement with in-built LSP features
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require('plugins.telescope') end,
        cmd = {'Telescope'},
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-bibtex.nvim'}
        }
    }

    -- basically vim-commentary in lua
    -- 'gcc' to comment an uncomment stuff
    use {
        'winston0410/commented.nvim',
        config = function()
            require('commented').setup({
                keybindings = {n = 'gc', v = 'gc', nl = 'gcc'}
            })
        end
        -- NOTE: does not work properly if lazy loaded o.O
        -- keys = {'gc'}
        -- cmd = {'Comment'}
    }

    -- colorschemes with support for Treesitter, LSP, and so on
    -- NOTE: load UI plugins after sourcing the colorscheme, for performance
    -- and to overwrite highlight groups properly
    use {
        'marko-cerovac/material.nvim',
        config = function() require('plugins.material') end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        -- event = 'CursorMoved',
        wants = 'nvim-treesitter',
        after = 'material.nvim',
        config = function() require('plugins.others').indent_bline() end
    }

    -- lua statusline
    use {
        'famiu/feline.nvim',
        event = 'BufWinEnter',
        config = "require('plugins.feline')",
        after = 'material.nvim',
        wants = 'gitsigns.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- gitgutter replacement
    use {
        'lewis6991/gitsigns.nvim',
        after = 'material.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = "require('plugins.gitsigns')"
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'CursorHold',
        config = "require('plugins.treesitter')",
        run = ':TSUpdate'
    }

    use {

        'p00f/nvim-ts-rainbow',
        event = 'CursorMoved',
        after = 'nvim-treesitter'

    }

    -- tab in normal to 'exit' strings, lists, etc.
    use {
        'abecodes/tabout.nvim',
        config = function() require('plugins.tabout') end,
        after = 'nvim-compe',
        wants = 'nvim-treesitter',
        event = 'InsertEnter'
    }

    -- treesitter powered matchup
    -- e.g., detects switch statements blocks and so on
    -- has performance issues
    use {
        'andymass/vim-matchup',
        wants = 'nvim-treesitter',
        event = 'CursorMoved',
        config = function() require('plugins.others').matchup() end
    }

    use {

        'windwp/nvim-autopairs',
        wants = 'nvim-treesitter',
        after = 'nvim-compe',
        config = function() require('plugins.nvim-autopairs') end

    }

    -- open agenda with ',oa'
    use {
        'kristijanhusak/orgmode.nvim',
        after = 'nvim-compe',
        config = function() require('plugins.orgmode') end
    }

    -- provides a file outline
    use {
        'liuchengxu/vista.vim',
        opt = true,
        cmd = 'Vista',
        config = function() vim.g.vista_default_executive = 'nvim_lsp' end

    }

    -- goyo replacement
    use {
        'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        requires = {"folke/twilight.nvim", cmd = 'ZenMode'},
        config = function() require('plugins.others').zen() end
    }

    -- NOTE: symbols-outline has more features than vista, e.g., renaming
    -- but it relies on LSP. Unlike vista which is able to use tags
    -- use {'simrat39/symbols-outline.nvim', opt = true, cmd = {'SymbolsOutline'}}

    -- use {'ggandor/lightspeed.nvim'}

    use {
        'glepnir/dashboard-nvim',
        -- wants = 'telescope.nvim',
        event = 'BufWinEnter',
        config = function() require('plugins.dashboard') end
    }
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        ft = {'markdown', 'md'}
    }

    use {'https://github.com/plasticboy/vim-markdown', ft = {'markdown', 'md'}}

end)
