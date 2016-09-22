execute pathogen#infect()
syntax on
filetype plugin on
filetype plugin indent on
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
let mapleader=";"

map <C-d> :NERDTreeToggle<CR>
map <leader>g :b#<CR>
map <leader>f :bnext<CR>
map <leader>b :bprevious<CR>
map <leader>t :ls<CR>:b<SPACE>
map <leader>q :b#<bar>:bd#<CR>

set shiftwidth=2
set tabstop=2
set guifont=InputMono:h15
set hlsearch
set laststatus=2
set visualbell
set hidden
colorscheme desert
