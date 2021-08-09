local npairs = require("nvim-autopairs")

npairs.setup({check_ts = true, fast_wrap = {map = '<C-e>', end_key = '<C-e>'}})

require('nvim-treesitter.configs').setup {autopairs = {enable = true}}

require("nvim-autopairs.completion.compe").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true -- it will auto insert `(` after select function or method item
})
