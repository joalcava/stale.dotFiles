" Must Have configurations
"-----------------------------------------------------------
set t_ut=""
set t_Co=256
set nocompatible            "vim defaults not Vi
set encoding=utf-8          "encoding, necessary for YCM
set hlsearch                "highlight search matches
set expandtab               "indent using spaces instead of tabs
set shiftwidth=2            "the number of spaces to use for each indent
set softtabstop=2           "number of spaces to use for a <Tab> during editing operations
set spelllang=es_es,en_us   "add es and en dictionaries to spelling
set number                  "show line numbers
set nowrap                  "don't wrap lines
set showtabline=2           "always enable tabs
set bs=2                    "allow backspacing over everything in insert mode
set ai                      "always set autoindenting on
set showmatch               "show matching brackets
set hidden                  "allows to switch between multiple buffers without saving
set mousehide               "hide the mouse pointer while typing.
set clipboard=unnamed       "yank naturally
set history=80              "set the history size to maximum
set splitbelow              "more naturall split opening
set splitright              "more naturall split opening
set noeb vb t_vb=           "disable beep
au GUIEnter * set vb t_vb=  "disable beep
let mapleader=","           "remap leader key
syntax on                   "switch on syntax highlighting.
filetype plugin on


" Appearance
"-----------------------------------------------------------
set go-=T                   "removes the toolbar
set go-=m                   "remove menu bar
set go-=r                   "remove right-hand scroll bar
set go-=L                   "remove left-hand scroll bar
set background=dark         "use dark themes

"font
if has("gui_running")
  set guioptions=icpM
  if has("gui_gtk2")
    set guifont=iosevka\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Agave:h14
    "use directx to render fonts
    set rop=type:directx,gamma:1.25,contrast:0.25,level:0.75,geom:1,renmode:5,taamode:1
  else
    set guifont=fira\ code\ 10
  endif
endif


" Key bindings
"-----------------------------------------------------------
"set tab features just like browser
map <C-t> <Esc>:tabnew<CR>
map <C-F4> <Esc>:tabclose<CR>
map <C-Tab> <Esc>:tabnext<CR>
map <C-S-Tab> <Esc>:tabprev<CR>

"allow to go up an down wrapped lines
map j gj
map k gk

"switch between splits more easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"moving lines and preserving indentation http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-Up> :m .+1<CR>==
nnoremap <C-Down> :m .-2<CR>==
inoremap <C-Up> <Esc>:m .+1<CR>==gi
inoremap <C-Down> <Esc>:m .-2<CR>==gi
vnoremap <C-Up> :m '>+1<CR>gv=gv
vnoremap <C-Down> :m '<-2<CR>gv=gv

"open NERDTree
map <C-e> :NERDTreeToggle<CR>
"split the current file (horizontal split)
map <F6> :split<CR>
"vertical split
map <S-F6> : vsplit<CR> 
"quit without saving
map <C-Q> :q!<CR>
"open NerdTree in current file directory
map <leader>ee :NERDTreeFind<CR>
"reload vimrc   
nmap <silent> <leader>rc :so $MYVIMRC<CR> 
"clear search with shift+enter
nnoremap <S-CR> :noh<CR>
"next error or lint
nnoremap <C-Right> :ALENext<CR>
"prev error or lint
nnoremap <C-Left> :ALEPrevious<CR>
"go to definition
nnoremap <leader>jd :YcmCompleter GoTo<CR>
"create a mark
nnoremap gm m
"open fzf using only git files
nnoremap <C-p> :FZF<CR>
"nnoremap <C-p> :GFiles<CR>


" Plugins
"-----------------------------------------------------------
call plug#begin('~/.vim/plugged')

"syntax
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Valloric/YouCompleteMe'

"file and directory management
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"util
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-repeat'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

"misc
Plug 'tpope/vim-sensible'
Plug 'Yggdroot/indentLine'

"themes and appearance
Plug 'srcery-colors/srcery-vim'
Plug 'pineapplegiant/spaceduck'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'sjl/badwolf'
Plug 'jaredgorski/spacecamp'

Plug 'vim-airline/vim-airline'

call plug#end()


" Plugins configurations
"-----------------------------------------------------------
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"use powerline fonts in airline
let g:airline_powerline_fonts = 1

" JAVASCRIPT SPECIFIC
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js"
let g:ale_linters = {'javascript': ['standard']} "use standard js
let g:ale_fixers = {'javascript': ['standard']}  "use standard js
let g:ale_lint_on_save = 1  "lint on save
let g:ale_fix_on_save = 1   "fix on save
let g:jsx_ext_required=0    "allow JSX in .js files

"colorscheme
"let g:material_style='oceanic'
"let g:airline_theme='palenight'
"let g:airline_theme='spaceduck'
let g:palenight_terminal_italics=1
"colorscheme gruvbox
if has("gui_running")
  colorscheme srcery
  "colorscheme spacecamp
else
  "colorscheme gruvbox
  colorscheme spacecamp
endif
  

"remap add mark, shoud be here for some reason
nnoremap gm m
