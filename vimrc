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
set guifont=Monaco:h15
set hlsearch
set laststatus=2
set visualbell
set hidden
set number
set relativenumber
colorscheme desert
colorscheme torte 

if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" only use eslint for javascript files
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:NERDSpaceDelims = 1

" folding config tweaks
let g:vim_markdown_folding_disabled = 1

" allow for project specific .vimrc files
set exrc
set secure
