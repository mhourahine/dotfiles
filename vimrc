"***** Plugins *****
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'larsbs/vimterial_dark'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'nanotech/jellybeans.vim'
Plug 'ruanyl/vim-gh-line'
"syntax support
Plug 'dense-analysis/ale'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mustache/vim-mustache-handlebars'
Plug 'cakebaker/scss-syntax.vim'
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}
Plug 'elzr/vim-json'
Plug 'mogelbrod/vim-jsonpath'
call plug#end()

scriptencoding utf-8
set encoding=utf-8
syntax on
filetype plugin on
filetype plugin indent on

"colorscheme desert
"colorscheme adventurous
"colorscheme dankneon
set background=dark
"colorscheme palenight
"colorscheme default
colorscheme jellybeans

"let mapleader=";"
map <leader>d :NERDTreeFind<CR>
map <leader>g :b#<CR>
map <leader>b :Buffers<CR>
map <leader>t :ls<CR>:b<SPACE>
map <leader>q :b#<bar>:bd#<CR>
map <leader>f :GFiles<CR>
map <leader>n :exe 'norm i##'.system("date")<CR>
map <leader>y :w !pbcopy<CR><CR>
map <leader>s :Ag <C-r>0<CR>
vnoremap <leader># y:Ag <C-R>=escape(@",'/\')<CR><CR>
"paste without yanking
vnoremap <leader>p "_dP
nnoremap <leader>a ggVG
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap <C-Down> <C-d>
nnoremap <C-Up> <C-u>

set shiftwidth=2
set tabstop=2
set guifont=Monaco:h15
set hlsearch
set visualbell
set hidden
set number
set relativenumber
set rtp+=/usr/local/opt/fzf
set tags=./tags,tags;
set list
	set listchars=tab:\⎪\ 
set showmatch  "show matching bracket

" statusline stuff
set laststatus=2
set statusline=%{FugitiveStatusline()}
set statusline+=\ \ %f
set statusline+=\ \ %y
set statusline+=%=
set statusline+=%3*\ Line:\ %l\/%L
set statusline+=\ Col:\ %c

" folding config tweaks
set foldmethod=indent
set foldlevelstart=99

" allow for project specific .vimrc files
set exrc
set secure

"make completion use only current file and ctags
set complete=.,t  "

"set mouse support
set mouse+=a
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end

if has("clipboard")
	set clipboard=unnamed " copy to the system clipboard

	if has("unnamedplus") " X11 support
		set clipboard+=unnamedplus
	endif
endif

" configured grep to use ag
if executable('ag')
	set grepprg=ag\ --vimgrep\ $*
	set grepformat=%f:%l:%c:%m
endif

" romainl's grep set up from https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
function! Grep(...)
	return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END
" end of romainl's snippet

" set up ALE
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_javascript_eslint_executable='npx eslint'

let g:NERDSpaceDelims = 1
let g:javascript_plugin_jsdoc = 1

" Change cursor in edit mode when using iTerm.  Also deal with the case of
" tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"**** COMMANDS ****
"
command Maketags !ag --hidden --ignore .git -g "" | ctags -R  --links=no -L -
command Notes call OpenNotes()
command Formatjson %!python -m json.tool
command! BufOnly silent! execute "%bd|e#|bd#"

function! OpenNotes()
	set wrap
	set linebreak
	cd ~/Dropbox/notes
	e today.md
endfunction
