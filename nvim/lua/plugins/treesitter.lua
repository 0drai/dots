require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'c', 'cpp', 'lua', 'json', 'yaml', 'python', 'latex', 'bash', 'html',
        'typescript', 'javascript', 'cmake', 'bibtex', 'dockerfile', 'rust',
        'comment', 'toml'
    },

    highlight = {enable = true},

    textobjects = {
        select = {
            enable = true,
            lookeahead = true,
            keymaps = {
                ["ac"] = "@comment.outer",
                ["ic"] = "@class.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner"
            }
        },

        swap = {
            enable = true,
            swap_next = {["g>"] = "@parameter.inner"},
            swap_previous = {["g<"] = "@parameter.inner"}
        }
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = ".",
            scope_incremental = ";",
            node_decremental = "-"
        }
    },

    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 500
    },

    matchup = {
        enable = true -- mandatory, false will disable the whole extension
    },

    autopairs = {enable = true},
    indent = {enable = true, disable = {"python"}}
}

-- local ts_parser = require('nvim-treesitter.parsers').get_parser_configs()

-- ts_parser.norg = {
-- install_info = {
-- url = "https://github.com/vhyrro/tree-sitter-norg",
-- files = {"src/parser.c"},
-- branch = "main"
-- }
-- }

-- ts_parser.markdown = {
-- install_info = {
-- url = "https://github.com/ikatyang/tree-sitter-markdown",
-- files = {"src/parser.c"}
-- }
-- }
