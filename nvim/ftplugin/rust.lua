local opt = vim.opt_local

opt.textwidth = 100
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

if pcall(require, 'rust-tools') and pcall(require, 'lspconfig') then
    require('rust-tools').setup({})
end
