execute pathogen#infect()
scriptencoding utf-8
set encoding=utf-8
syntax on
filetype plugin on
filetype plugin indent on

"colorscheme desert
"colorscheme adventurous
"colorscheme dankneon
set background=dark
colorscheme palenight

let mapleader=";"
map <leader>d :NERDTreeFind<CR>
map <leader>g :b#<CR>
map <leader>f :bnext<CR>
map <leader>b :bprevious<CR>
map <leader>t :ls<CR>:b<SPACE>
map <leader>q :b#<bar>:bd#<CR>
map <leader>s :FZF<CR>
map <leader>n :exe 'norm i##'.system("date")<CR>

set shiftwidth=2
set tabstop=2
set guifont=Monaco:h15
set hlsearch
set laststatus=2
set visualbell
set hidden
set number
set relativenumber
set rtp+=/usr/local/opt/fzf
set tags=./tags,tags;
set list
set listchars=tab:\⎪\   

" allow for project specific .vimrc files
set exrc
set secure

"make completion use only current file and ctags
set complete=.,t  "

"set mouse support properly when using tmux
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif


if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" set up ALE
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_javascript_eslint_executable='npx eslint'

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

command Maketags !ctags -R .

com! Formatjson %!python -m json.tool
