execute pathogen#infect()
syntax on
filetype plugin indent on
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2

map <C-d> :NERDTreeToggle<CR>
map <C-f> :Ack<CR> 
map ;g :b#<CR>
map ;f :bnext<CR>
map ;b :bprevious<CR>

set tabstop=2
set guifont=Menlo:h15
set hlsearch
set laststatus=2
set visualbell
colorscheme desert
