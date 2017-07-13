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
map <leader>r <C-p>

set shiftwidth=2
set tabstop=2
set guifont=InputMono:h15
set hlsearch
set laststatus=2
set visualbell
set hidden
colorscheme desert

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" folding config tweaks
let g:vim_markdown_folding_disabled = 1

" allow for project specific .vimrc files
set exrc
set secure
