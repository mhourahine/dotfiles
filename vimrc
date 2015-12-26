execute pathogen#infect()
syntax on
filetype plugin on
filetype plugin indent on
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2

map <C-d> :NERDTreeToggle<CR>
map <C-f> :Ack<CR> 
map ;g :b#<CR>
map ;f :bnext<CR>
map ;b :bprevious<CR>
map ;t :ls<CR>:b<SPACE>
map ;q :b#<bar>:bd#<CR>

set shiftwidth=2
set tabstop=2
set guifont=Menlo:h15
set hlsearch
set laststatus=2
set visualbell
set hidden
colorscheme desert
