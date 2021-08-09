require('format').setup {
    ['*'] = {tempfile_dir = '/tmp/'},
    lua = {{cmd = {"lua-format -i"}}},
    go = {{cmd = {"gofmt -w", "goimports -w"}}},
    javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    yaml = {{cmd = {'prettier -w'}}},
    sh = {{cmd = {"shfmt -w"}}},
    zsh = {{cmd = {"shfmt -w"}}}, -- :-(
    rust = {{cmd = {"rustfmt"}}},
    python = {{cmd = {"yapf"}}},

    markdown = {{cmd = {"prettier -w", 'markdownlint -f'}}},
}
