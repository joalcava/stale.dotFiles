""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL CONFIGURATION

:set number " Line numbers
:set nowrap " Don't wrap lines
set hlsearch " Highlight search matches
set expandtab " Indent using spaces instead of tabs
set shiftwidth=2 " The number of spaces to use for each indent
set softtabstop=2" " Number of spaces to use for a <Tab> during editing operations
nnoremap <S-CR> :noh<CR> " clear search with shift+enter

" Allow to go up an down wrapped lines
map j gj
map k gk

" Moving lines and preserving indentation http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-Up> :m .+1<CR>==
nnoremap <C-Down> :m .-2<CR>==
inoremap <C-Up> <Esc>:m .+1<CR>==gi
inoremap <C-Down> <Esc>:m .-2<CR>==gi
vnoremap <C-Up> :m '>+1<CR>gv=gv
vnoremap <C-Down> :m '<-2<CR>gv=gv
map <C-S> :w<CR> " save file
nnoremap gm m " Create a mark

" split the current file (horizontal split)
map <F6> :split<CR>
" Shift F6 will do vertical split
map <S-F6> : vsplit<CR>

" Quit without saving
map <C-Q> :q!<CR>


nnoremap <C-Right> :ALENext<CR>
nnoremap <C-Left> :ALEPrevious<CR>

let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS

call plug#begin('~/.vim/plugged')
" Syntax
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
Plug 'svermeulen/vim-easyclip'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Themes
Plug 'hzchirs/vim-material'
Plug 'soft-aesthetic/soft-era-vim'
call plug#end()

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree
map <C-e> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JAVASCRIPT SPECIFIC

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js"
let g:ale_linters = {'javascript': ['standard']}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" Allow JSX in .js files
let g:jsx_ext_required=0 

nnoremap <C-p> :FZF<CR>
nnoremap <C-P> :FZF<CR>