execute pathogen#infect()
syntax on
filetype plugin on
filetype plugin indent on

let mapleader=";"
map <leader>d :NERDTreeFind<CR>
map <leader>g :b#<CR>
map <leader>f :bnext<CR>
map <leader>b :bprevious<CR>
map <leader>t :ls<CR>:b<SPACE>
map <leader>q :b#<bar>:bd#<CR>
map <leader>s :FZF<CR>

set shiftwidth=2
set tabstop=2
set guifont=Monaco:h15
set hlsearch
set laststatus=2
set visualbell
set hidden
set number
set relativenumber
set mouse=a
set rtp+=/usr/local/opt/fzf


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

" Change cursor in edit mode when using iTerm.  Also deal with the case of
" tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

function Mgoyo()
	set filetype=markdown
	Goyo
endfunction
command Mgoyo call Mgoyo()

" allow for project specific .vimrc files
set exrc
set secure
