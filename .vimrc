" Must Have configurations
"-----------------------------------------------------------
set nocompatible            "vim defaults not Vi
set encoding=utf-8          "encoding, necessary for YCM
set hlsearch                "highlight search matches
set expandtab               "indent using spaces instead of tabs
set shiftwidth=2            "the number of spaces to use for each indent
set softtabstop=2           "number of spaces to use for a <Tab> during editing operations
set spelllang=en_us,es_es   "add es dictionary to spelling
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
"colorscheme
colorscheme vim-material
let g:material_style='oceanic'
let g:airline_theme='material'
"font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=iosevka\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=iosevka:h12
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

"misc
map <C-e> :NERDTreeToggle<CR> " Open NERDTree
map <F6> :split<CR>           "split the current file (horizontal split)
map <S-F6> : vsplit<CR>       "vertical split
map <C-Q> :q!<CR>             "quit without saving
map <leader>ee :NERDTreeFind<CR>          "open NerdTree in current file directory
nmap <silent> <leader>rc :so $MYVIMRC<CR> "reload vimrc
nnoremap ; :                              "allow ; to act like : in normal mode
nnoremap <S-CR> :noh<CR>                  "clear search with shift+enter
nnoremap <C-Right> :ALENext<CR>           "next error or lint
nnoremap <C-Left> :ALEPrevious<CR>        "prev error or lint
nnoremap <leader>jd :YcmCompleter GoTo<CR>"go to definition
nnoremap gm m              "create a mark
nnoremap <C-p> :GFiles<CR> "open fzf using only git files


" Plugins
"-----------------------------------------------------------
call plug#begin('~/.vim/plugged')

"syntax
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
Plug 'svermeulen/vim-easyclip'
Plug 'alvan/vim-closetag'

"misc
Plug 'tpope/vim-sensible'
Plug 'Yggdroot/indentLine'

"themes and appearance
Plug 'rainglow/vim'
Plug 'hzchirs/vim-material'
Plug 'soft-aesthetic/soft-era-vim'
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
