require('gitsigns').setup {
    signs = {
        add = {
            hl = 'GitSignsAdd',
            text = '│',
            numhl = 'GitSignsAddNr',
            linehl = 'GitSignsAddLn'
        },
        change = {
            hl = 'GitSignsChange',
            text = '│',
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn'
        },
        delete = {
            hl = 'GitSignsDelete',
            text = '_',
            numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn'
        },
        topdelete = {
            hl = 'GitSignsDelete',
            text = '‾',
            numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn'
        },
        changedelete = {
            hl = 'GitSignsChange',
            text = '~',
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn'
        }
    },
    numhl = false,
    linehl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,

        ['n ]g'] = {
            expr = true,
            "&diff ? ']g' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"
        },
        ['n [g'] = {
            expr = true,
            "&diff ? '[g' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"
        },

        ['n <localleader>ga'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ['v <localleader>ga'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <localleader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['n <localleader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ['v <localleader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <localleader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ['n <localleader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n <localleader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

        -- Text objects
        ['o ig'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        ['x ig'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
    },
    watch_index = {interval = 1000, follow_files = true},
    current_line_blame = false,
    current_line_blame_delay = 1000,
    current_line_blame_position = 'eol',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    word_diff = false,
    -- use_decoration_api = true,
    use_internal_diff = true -- If luajit is present
}
