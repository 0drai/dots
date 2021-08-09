local opt = vim.opt
local g = vim.g

-- read file changes automatically
opt.autoread = true

opt.title = true

opt.cursorline = true

opt.hidden = true

-- always show status line
opt.laststatus = 2

opt.signcolumn = 'yes'

-- disable completion messages
opt.shortmess = vim.o.shortmess .. 'c'

opt.number = true
opt.relativenumber = true

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = true
opt.magic = true

-- unnamedplus = use the + register (cmd-v paste in our term)
opt.clipboard = {'unnamed', 'unnamedplus'}

-- enable wrap on long lines
opt.wrap = true

-- opt.wildignore = {
-- '*.swp', '*.bak', '*.pyc', '*.class', '*.aux', '*toc', '*blg', '*.bcf',
-- '*bbl', '*.tdo', '*.bin', '*.so', '*.rlib', '*_build/*', '*build/*',
-- '*/coverage/*'
-- }

opt.wildmode = 'longest,full'
opt.wildignorecase = true

-- not breaking words on line wrap
opt.linebreak = true

-- scroll vertically/horizontally
opt.scrolloff = 10
opt.sidescrolloff = 20
opt.sidescroll = 1

-- indentations
opt.shiftwidth = 2 -- indent by 1 column
opt.shiftround = true -- tab indent to nearest level
opt.textwidth = 79 -- max pasted text width
opt.autoindent = true -- copy indent from current line
opt.smartindent = true -- enable c-style indenting in c/c++ files
opt.tabstop = 2 -- indent level every column
opt.softtabstop = 2 -- tab indent when mixing spaces and tabs
opt.expandtab = true -- convert tabs to spaces

-- disable backups and swap files
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- python to micromamba
g.python3_host_prog = '/opt/micromamba/bin/python'
