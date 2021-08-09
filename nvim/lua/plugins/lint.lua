local lint = require('lint')

lint.linters_by_ft = {
    c = {'clangtidy', 'cppcheck', 'codespell'},
    sh = {'shellcheck', 'codespell'},
    lua = {'codespell'},
    javascript = {'eslint'},
    typescript = {'eslint'},
    python = {'codespell'},
    dockerfile = {'hadolint', 'codespell'},
    bash = {'shellcheck', 'codespell'},

    -- text = {'languagetool'},
    markdown = {'markdownlint'},
    norg = {'markdownlint'},
    vimwiki = {'markdownlint'}
}

vim.cmd([[au BufWritePost <buffer> lua require('lint').try_lint() ]])
