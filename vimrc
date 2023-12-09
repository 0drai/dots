colorscheme sorbet
set encoding=utf-8
set viminfo=""
set number
set relativenumber
set laststatus=2
set cursorline
set signcolumn="auto"
set splitright
set ignorecase
set splitbelow
set scrolloff=10
set sidescrolloff=20
set sidescroll=1
set nobackup
set nowritebackup
set undofile
set noswapfile
set spelllang="en_US"
set confirm
set wildmenu
set wildmode="longest:full,full"
set wildignorecase

" Quicker <Esc> in insert mode
inoremap <silent> jk <Esc>

nnoremap 0 ^
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap gQ :q!<CR>
nnoremap gx :x!<CR>

nnoremap ,cd :cd %:p:h<cr>:pwd<cr>

nnoremap <space>te :Texplore<CR>
nnoremap <space>se :Sexplore<CR>
nnoremap <space>ee :Explore<CR>
